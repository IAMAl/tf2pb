import os

from absl import app 
from absl import flags

import tensorflow as tf
from tensorflow.python.framework.graph_util import convert_variables_to_constants
import util

import onnx
import tf2onnx

'''Import Model from model.py file'''
import model

flags.DEFINE_integer('batch_size',   4, 'The size of a sample batch.')
flags.DEFINE_integer('img_height', 128, 'Image height.')
flags.DEFINE_integer('img_width',  416, 'Image width.')
flags.DEFINE_integer('seq_length',   3, 'Sequence length for each example.')

flags.DEFINE_string('model_ckpt', None, 'Model checkpoint to load.')
flags.DEFINE_string('output_path', "output_path", 'Output File Name')
flags.DEFINE_string('output_file_name', "model.pb", 'Output File Name')
FLAGS = flags.FLAGS


def freeze_session(session, keep_var_names=None, output_names=None, clear_devices=True):

    graph = session.graph
    with graph.as_default():
        freeze_var_names = list(set(v.op.name for v in tf.global_variables()).difference(keep_var_names or []))
        output_names = output_names or []
        output_names += [v.op.name for v in tf.global_variables()]
        # Graph -> GraphDef ProtoBuf
        input_graph_def = graph.as_graph_def()
        if clear_devices:
            for node in input_graph_def.node:
                node.device = ""
        frozen_graph = convert_variables_to_constants(session, input_graph_def,
                                                      output_names, freeze_var_names)
        return frozen_graph

def _run_pb_gen():

  '''Load Model from model.py file''' 
  inference_model = model.Model(is_training=False,
                seq_length=FLAGS.seq_length,
                batch_size=FLAGS.batch_size,
                img_height=FLAGS.img_height,
                img_width=FLAGS.img_width)

  with tf.Session() as sess:
    '''Initialize Variables in Model'''
    sess.run(tf.compat.v1.global_variables_initializer())

    '''Get Graph Def'''
    graph_def = sess.graph.as_graph_def()

    '''Extract Inputs'''
    inputs = []
    for op in sess.graph.get_operations():
        if op.type == "Placeholder":
          inputs.append(op.name)

    '''Extract Outputs'''
    name_list = []
    exclsv_list = []
    for node in graph_def.node:
        name_list.append(node.name)
        exclsv_list.extend(node.input)
    outputs = list(set(name_list) - set(exclsv_list))

    frozen_graph = freeze_session(sess, output_names=outputs)

    '''Freezing Model (Necessary before pb-generation)'''
    with tf.Graph().as_default() as tf_graph:
        tf.import_graph_def(frozen_graph, name='')
    with tf.Session(graph=tf_graph) as sess:
        onnx_graph = tf2onnx.tfonnx.process_tf_graph(sess.graph, input_names=inputs, output_names=outputs)

    '''Make ProtoBuff Model'''
    model_proto = onnx_graph.make_model(str(FLAGS.output_path))
    onnx.checker.check_model(model_proto)

    '''Store pb-file'''
    tf2onnx.utils.save_onnx_model("./", "saved_model", feed_dict={}, model_proto=model_proto)

    print('TF-Graph converted to SavedModel!')


def main(_):
  _run_pb_gen()


if __name__ == '__main__':
  app.run(main)
