import os

from absl import app 
from absl import flags

import tensorflow as tf
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
    graph = sess.graph

    '''Extract Inputs'''
    inputs = []
    for op in sess.graph.get_operations():
        if op.type == "Placeholder":
          inputs.append(op.name)

    '''Extract Outputs'''
    name_list = []
    exclsv_list = []
    for node in graph.as_graph_def().node:
        name_list.append(node.name)
        exclsv_list.extend(node.input)
    outputs = set(name_list) - set(exclsv_list)

    g = tf2onnx.tfonnx.process_tf_graph(sess.graph, input_names=inputs, output_names=outputs)

    '''Make ProtoBuff Model'''
    model_proto = g.make_model(str(FLAGS.output_path))
    onnx.checker.check_model(model_proto)

    '''Store pb-file'''
    tf2onnx.utils.save_onnx_model("./", "saved_model", feed_dict={}, model_proto=model_proto)
    #tf.io.write_graph(graph, str(FLAGS.output_path), str(FLAGS.output_file_name), as_text=False)

    print('TF-Graph converted to SavedModel!')


def main(_):
  _run_pb_gen()


if __name__ == '__main__':
  app.run(main)
