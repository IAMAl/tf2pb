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


def freeze_session(sess, graph_def, keep_var_names=None, output_names=None, clear_devices=True):

  freeze_var_names = list(set(v.op.name for v in tf.compat.v1.global_variables()).difference(keep_var_names or []))

  '''Clear Device Setting'''
  if clear_devices:
    for index, _ in enumerate(graph_def.node):
      graph_def.node[index].device = ""
      
  'Freezing Graph'''
  frozen_graph = tf.compat.v1.graph_util.convert_variables_to_constants(sess, graph_def, output_names, freeze_var_names)
  return frozen_graph


def _run_pb_gen():

  '''Load Model from model.py file''' 
  inference_model = model.Model(is_training=False,
                seq_length=FLAGS.seq_length,
                batch_size=FLAGS.batch_size,
                img_height=FLAGS.img_height,
                img_width=FLAGS.img_width)

  with tf.compat.v1.Session() as sess:
    '''Initialize Variables in Model'''
    init_op = tf.compat.v1.initialize_all_variables()
    sess.run(init_op)

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

    '''Freezing Graph (Necessary before Make ONNX Graph)'''
    needed_names = [tf2onnx.utils.node_name(i) for i in inputs] + [tf2onnx.utils.node_name(i) for i in outputs]
    sg_graph = tf.compat.v1.graph_util.extract_sub_graph(graph_def, needed_names)
    frozen_graph = freeze_session(sess, sg_graph, output_names=outputs)

    '''ONNX Graph Generation'''
    with tf.Graph().as_default() as tf_graph:
        tf.import_graph_def(frozen_graph, name='')
    with tf.compat.v1.Session(graph=tf_graph) as sess:
        '''Optimizing Grapph for ONNX FOrmation'''
        opt_graph = tf2onnx.optimizer.optimize_graph(sess.graph)
        onnx_graph = tf2onnx.tfonnx.process_tf_graph(opt_graph, input_names=inputs, output_names=outputs)

    '''Make ProtoBuff Model'''
    model_proto = onnx_graph.make_model(str(FLAGS.output_path))
    onnx.checker.check_model(model_proto)

    '''Store ProtoBuff-file'''
    tf2onnx.utils.save_onnx_model("./", "saved_model", feed_dict={}, model_proto=model_proto)

    print('TF-Graph converted to SavedModel!')


def main(_):
  _run_pb_gen()


if __name__ == '__main__':
  app.run(main)
