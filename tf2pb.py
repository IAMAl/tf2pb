from absl import app 
from absl import flags
import tensorflow as tf

'''Import Model from model.py file'''
import model

flags.DEFINE_integer('batch_size',   4, 'The size of a sample batch.')
flags.DEFINE_integer('img_height', 128, 'Image height.')
flags.DEFINE_integer('img_width',  416, 'Image width.')
flags.DEFINE_integer('seq_length',   3, 'Sequence length for each example.')
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

  '''Make Session'''
  sess = tf.Session()

  '''Initialize Variables in Model'''
  sess.run(tf.global_variables_initializer())

  '''Store pb-file'''
  tf.io.write_graph(sess.graph.as_graph_def(), str(FLAGS.output_path), str(FLAGS.output_file_name), as_text=False)

  print('TF-Graph converted to SavedModel!')


def main(_):
  _run_pb_gen()


if __name__ == '__main__':
  app.run(main)
