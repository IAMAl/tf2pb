import os
from absl import app 
from absl import flags
import tensorflow as tf
from tensorflow.core.framework import graph_pb2
import util
import onnx
import tf2onnx
from tf2onnx.tf_loader import tf_session, tf_reset_default_graph

'''Import Model from model.py file'''
import model

flags.DEFINE_integer('batch_size',   4, 'The size of a sample batch.')
flags.DEFINE_integer('img_height', 128, 'Image height.')
flags.DEFINE_integer('img_width',  416, 'Image width.')
flags.DEFINE_integer('seq_length',   3, 'Sequence length for each example.')
flags.DEFINE_string('output_path', "output_path", 'Output File Name')
flags.DEFINE_string('output_file_name', "model.pb", 'Output File Name')
FLAGS = flags.FLAGS


def freeze_session(sess, graph_def, keep_var_names=None, output_names=None, clear_devices=True):

  freeze_var_names = list(set(v.op.name for v in tf.compat.v1.global_variables()).difference(keep_var_names or []))
      
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
    init_op = tf.compat.v1.global_variables_initializer()

    '''Start Session'''
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

    '''Fix Nodes'''
    '''See: https://github.com/onnx/tensorflow-onnx/issues/77'''
    for node in graph_def.node:
      if node.op == 'RefSwitch':
        node.op = 'Switch'
        for index in range(len(node.input)):
          if 'moving_' in node.input[index]:
            node.input[index] = node.input[index] + '/read'
      elif node.op == 'AssignSub':
        node.op = 'Sub'
        if 'use_locking' in node.attr: del node.attr['use_locking']
      elif node.op == 'AssignAdd':
        node.op = 'Add'
        if 'use_locking' in node.attr: del node.attr['use_locking']
      elif node.op == 'Assign':
        node.op = 'Identity'
        if 'use_locking' in node.attr: del node.attr['use_locking']
        if 'validate_shape' in node.attr: del node.attr['validate_shape']
        if len(node.input) == 2:
          # input0: ref: Should be from a Variable node. May be uninitialized.
          # input1: value: The value to be assigned to the variable.
          node.input[0] = node.input[1]
          del node.input[1]

    '''Sub Graph Extraction'''
    needed_names = [tf2onnx.utils.node_name(i) for i in inputs] + [tf2onnx.utils.node_name(i) for i in outputs]
    sub_graph = tf.compat.v1.graph_util.extract_sub_graph(graph_def, needed_names)

    '''Freezing Graph (Necessary before Making ONNX Graph)'''
    frozen_graph = freeze_session(sess, sub_graph, output_names=outputs)

  '''Graph_Def to Graph Conversion'''
  tf_reset_default_graph()
  graph = tf.import_graph_def(frozen_graph, name='')

  with tf_session(graph=graph) as sess:
    '''Extract Inputs'''
    inputs = []
    for op in sess.graph.get_operations():
        if op.type == "Placeholder":
          inputs.append(op.name+':0')

    '''Extract Outputs'''
    name_list = []
    exclsv_list = []
    for node in graph_def.node:
        name_list.append(node.name+':0')
        exclsv_list.extend(node.input)
    outputs = list(set(name_list) - set(exclsv_list))

    '''ONNX Graph Generation'''
    onnx_graph = tf2onnx.tfonnx.process_tf_graph(sess.graph, 
                    input_names=inputs, 
                    output_names=outputs)

    '''Optimizing Grapph for ONNX Formation'''
    opt_graph = tf2onnx.optimizer.optimize_graph(onnx_graph)

    '''Make ProtoBuff Model'''
    model_proto = opt_graph.make_model(str(FLAGS.output_path))
    onnx.checker.check_model(model_proto)

    '''Store ProtoBuff-file'''
    tf2onnx.utils.save_onnx_model("./", "saved_model", feed_dict={}, model_proto=model_proto)

    print('TF-Graph converted to SavedModel!')


def main(_):
  _run_pb_gen()


if __name__ == '__main__':
  app.run(main)
