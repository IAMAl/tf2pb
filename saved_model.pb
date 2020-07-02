node {
  name: "depth_prediction/depth_prediction/raw_input"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_UINT8
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
        dim {
          size: 128
        }
        dim {
          size: 416
        }
        dim {
          size: 3
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/convert_image/Cast"
  op: "Cast"
  input: "depth_prediction/depth_prediction/raw_input"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_UINT8
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/convert_image/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.003921568859368563
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/convert_image"
  op: "Mul"
  input: "depth_prediction/depth_prediction/convert_image/Cast"
  input: "depth_prediction/depth_prediction/convert_image/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\007\000\000\000\007\000\000\000\003\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.05914847552776337
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05914847552776337
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/cnv1/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv1/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/cnv1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/cnv1/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/cnv1/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/cnv1/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/cnv1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 7
        }
        dim {
          size: 7
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv1/weights"
  input: "depth_prediction/depth_net/cnv1/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv1/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/cnv1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/convert_image"
  input: "depth_prediction/depth_net/cnv1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv1/BatchNorm/beta"
  input: "depth_prediction/depth_net/cnv1/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv1/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv1/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/cnv1/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv1/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv1/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/cnv1/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv1/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/Const"
  input: "depth_prediction/depth_net/cnv1/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv1/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv1/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv1/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv1/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\007\000\000\000\007\000\000\000 \000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0437408871948719
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0437408871948719
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/cnv1b/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv1b/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/cnv1b/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/cnv1b/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/cnv1b/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/cnv1b/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/cnv1b/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 7
        }
        dim {
          size: 7
        }
        dim {
          size: 32
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv1b/weights"
  input: "depth_prediction/depth_net/cnv1b/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv1b/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/cnv1b/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv1/Relu"
  input: "depth_prediction/depth_net/cnv1b/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv1b/BatchNorm/beta"
  input: "depth_prediction/depth_net/cnv1b/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv1b/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/Const"
  input: "depth_prediction/depth_net/cnv1b/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv1b/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/cnv2/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv2/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/cnv2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/cnv2/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/cnv2/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/cnv2/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/cnv2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv2/weights"
  input: "depth_prediction/depth_net/cnv2/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv2/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/cnv2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/Relu"
  input: "depth_prediction/depth_net/cnv2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv2/BatchNorm/beta"
  input: "depth_prediction/depth_net/cnv2/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv2/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv2/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/cnv2/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv2/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv2/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/cnv2/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv2/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/Const"
  input: "depth_prediction/depth_net/cnv2/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv2/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv2/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv2/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv2/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.04330126941204071
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.04330126941204071
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/cnv2b/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv2b/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/cnv2b/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/cnv2b/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/cnv2b/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/cnv2b/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/cnv2b/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv2b/weights"
  input: "depth_prediction/depth_net/cnv2b/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv2b/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/cnv2b/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv2/Relu"
  input: "depth_prediction/depth_net/cnv2b/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv2b/BatchNorm/beta"
  input: "depth_prediction/depth_net/cnv2b/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv2b/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/Const"
  input: "depth_prediction/depth_net/cnv2b/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv2b/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0589255653321743
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0589255653321743
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/cnv3/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv3/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/cnv3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/cnv3/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/cnv3/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/cnv3/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/cnv3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv3/weights"
  input: "depth_prediction/depth_net/cnv3/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv3/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/cnv3/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/Relu"
  input: "depth_prediction/depth_net/cnv3/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv3/BatchNorm/beta"
  input: "depth_prediction/depth_net/cnv3/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv3/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv3/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/cnv3/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv3/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv3/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/cnv3/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv3/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/Const"
  input: "depth_prediction/depth_net/cnv3/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv3/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv3/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv3/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv3/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.05103103816509247
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05103103816509247
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/cnv3b/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv3b/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/cnv3b/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/cnv3b/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/cnv3b/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/cnv3b/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/cnv3b/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv3b/weights"
  input: "depth_prediction/depth_net/cnv3b/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv3b/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/cnv3b/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv3/Relu"
  input: "depth_prediction/depth_net/cnv3b/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv3b/BatchNorm/beta"
  input: "depth_prediction/depth_net/cnv3b/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv3b/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/Const"
  input: "depth_prediction/depth_net/cnv3b/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv3b/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0416666679084301
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0416666679084301
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/cnv4/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv4/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/cnv4/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/cnv4/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/cnv4/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/cnv4/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/cnv4/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv4/weights"
  input: "depth_prediction/depth_net/cnv4/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv4/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/cnv4/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/Relu"
  input: "depth_prediction/depth_net/cnv4/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv4/BatchNorm/beta"
  input: "depth_prediction/depth_net/cnv4/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv4/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv4/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/cnv4/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv4/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv4/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/cnv4/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv4/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/Const"
  input: "depth_prediction/depth_net/cnv4/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv4/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv4/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv4/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv4/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03608439117670059
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03608439117670059
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/cnv4b/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv4b/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/cnv4b/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/cnv4b/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/cnv4b/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/cnv4b/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/cnv4b/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv4b/weights"
  input: "depth_prediction/depth_net/cnv4b/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv4b/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/cnv4b/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv4/Relu"
  input: "depth_prediction/depth_net/cnv4b/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv4b/BatchNorm/beta"
  input: "depth_prediction/depth_net/cnv4b/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv4b/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/Const"
  input: "depth_prediction/depth_net/cnv4b/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv4b/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.02946278266608715
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.02946278266608715
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/cnv5/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv5/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/cnv5/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/cnv5/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/cnv5/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/cnv5/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/cnv5/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv5/weights"
  input: "depth_prediction/depth_net/cnv5/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv5/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/cnv5/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/Relu"
  input: "depth_prediction/depth_net/cnv5/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv5/BatchNorm/beta"
  input: "depth_prediction/depth_net/cnv5/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv5/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv5/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/cnv5/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv5/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv5/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/cnv5/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv5/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/Const"
  input: "depth_prediction/depth_net/cnv5/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv5/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv5/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv5/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv5/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.025515519082546234
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.025515519082546234
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/cnv5b/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv5b/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/cnv5b/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/cnv5b/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/cnv5b/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/cnv5b/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/cnv5b/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 512
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv5b/weights"
  input: "depth_prediction/depth_net/cnv5b/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv5b/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/cnv5b/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv5/Relu"
  input: "depth_prediction/depth_net/cnv5b/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv5b/BatchNorm/beta"
  input: "depth_prediction/depth_net/cnv5b/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv5b/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/Const"
  input: "depth_prediction/depth_net/cnv5b/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv5b/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.025515519082546234
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.025515519082546234
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/cnv6/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv6/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/cnv6/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/cnv6/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/cnv6/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/cnv6/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/cnv6/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 512
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv6/weights"
  input: "depth_prediction/depth_net/cnv6/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv6/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/cnv6/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/Relu"
  input: "depth_prediction/depth_net/cnv6/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv6/BatchNorm/beta"
  input: "depth_prediction/depth_net/cnv6/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv6/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv6/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/cnv6/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv6/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv6/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/cnv6/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv6/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/Const"
  input: "depth_prediction/depth_net/cnv6/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv6/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv6/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv6/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv6/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.025515519082546234
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.025515519082546234
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/cnv6b/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv6b/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/cnv6b/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/cnv6b/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/cnv6b/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/cnv6b/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/cnv6b/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 512
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv6b/weights"
  input: "depth_prediction/depth_net/cnv6b/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv6b/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/cnv6b/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv6/Relu"
  input: "depth_prediction/depth_net/cnv6b/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv6b/BatchNorm/beta"
  input: "depth_prediction/depth_net/cnv6b/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv6b/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/Const"
  input: "depth_prediction/depth_net/cnv6b/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv6b/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.025515519082546234
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.025515519082546234
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/cnv7/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv7/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/cnv7/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/cnv7/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/cnv7/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/cnv7/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/cnv7/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 512
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv7/weights"
  input: "depth_prediction/depth_net/cnv7/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv7/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/cnv7/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/Relu"
  input: "depth_prediction/depth_net/cnv7/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv7/BatchNorm/beta"
  input: "depth_prediction/depth_net/cnv7/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv7/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv7/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/cnv7/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv7/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv7/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/cnv7/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv7/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/Const"
  input: "depth_prediction/depth_net/cnv7/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv7/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv7/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv7/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv7/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.025515519082546234
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.025515519082546234
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/cnv7b/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv7b/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/cnv7b/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/cnv7b/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/cnv7b/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/cnv7b/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/cnv7b/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 512
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv7b/weights"
  input: "depth_prediction/depth_net/cnv7b/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv7b/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/cnv7b/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv7/Relu"
  input: "depth_prediction/depth_net/cnv7b/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv7b/BatchNorm/beta"
  input: "depth_prediction/depth_net/cnv7b/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv7b/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/Const"
  input: "depth_prediction/depth_net/cnv7b/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/cnv7b/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.025515519082546234
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.025515519082546234
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/upcnv7/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv7/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/upcnv7/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/upcnv7/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/upcnv7/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/upcnv7/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/upcnv7/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 512
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv7/weights"
  input: "depth_prediction/depth_net/upcnv7/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv7/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/upcnv7/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\004\000\000\000\001\000\000\000\004\000\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_1"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_1/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_1/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_2"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_2/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_2/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/mul/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/mul/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/mul_1"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_2"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/stack/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 512
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/stack"
  op: "Pack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/mul_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/stack/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_3/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_3/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_3/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_3"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_3/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_3/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/strided_slice_3/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/conv2d_transpose"
  op: "Conv2DBackpropInput"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/stack"
  input: "depth_prediction/depth_net/upcnv7/weights/read"
  input: "depth_prediction/depth_prediction/depth_net/cnv7b/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv7/BatchNorm/beta"
  input: "depth_prediction/depth_net/upcnv7/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv7/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/conv2d_transpose"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/Const"
  input: "depth_prediction/depth_net/upcnv7/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv7/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/ResizeNearestNeighbor/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\002\000\000\000\007\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/ResizeNearestNeighbor"
  op: "ResizeNearestNeighbor"
  input: "depth_prediction/depth_prediction/depth_net/upcnv7/Relu"
  input: "depth_prediction/depth_prediction/depth_net/ResizeNearestNeighbor/size"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "align_corners"
    value {
      b: false
    }
  }
  attr {
    key: "half_pixel_centers"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/concat"
  op: "ConcatV2"
  input: "depth_prediction/depth_prediction/depth_net/ResizeNearestNeighbor"
  input: "depth_prediction/depth_prediction/depth_net/cnv6b/Relu"
  input: "depth_prediction/depth_prediction/depth_net/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\004\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.02083333395421505
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.02083333395421505
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/icnv7/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv7/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/icnv7/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/icnv7/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/icnv7/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/icnv7/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/icnv7/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1024
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv7/weights"
  input: "depth_prediction/depth_net/icnv7/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv7/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/icnv7/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/concat"
  input: "depth_prediction/depth_net/icnv7/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv7/BatchNorm/beta"
  input: "depth_prediction/depth_net/icnv7/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv7/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv7/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/icnv7/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv7/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv7/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/icnv7/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv7/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv7/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/Const"
  input: "depth_prediction/depth_net/icnv7/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv7/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/icnv7/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv7/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/icnv7/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv7/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.025515519082546234
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.025515519082546234
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/upcnv6/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv6/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/upcnv6/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/upcnv6/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/upcnv6/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/upcnv6/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/upcnv6/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 512
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv6/weights"
  input: "depth_prediction/depth_net/upcnv6/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv6/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/upcnv6/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\004\000\000\000\002\000\000\000\007\000\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_1"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_1/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_1/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_2"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_2/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_2/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/mul/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/mul/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/mul_1"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_2"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/stack/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 512
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/stack"
  op: "Pack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/mul_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/stack/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_3/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_3/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_3/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_3"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_3/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_3/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/strided_slice_3/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/conv2d_transpose"
  op: "Conv2DBackpropInput"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/stack"
  input: "depth_prediction/depth_net/upcnv6/weights/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv7/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv6/BatchNorm/beta"
  input: "depth_prediction/depth_net/upcnv6/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv6/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/conv2d_transpose"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/Const"
  input: "depth_prediction/depth_net/upcnv6/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv6/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/ResizeNearestNeighbor_1/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\004\000\000\000\r\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/ResizeNearestNeighbor_1"
  op: "ResizeNearestNeighbor"
  input: "depth_prediction/depth_prediction/depth_net/upcnv6/Relu"
  input: "depth_prediction/depth_prediction/depth_net/ResizeNearestNeighbor_1/size"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "align_corners"
    value {
      b: false
    }
  }
  attr {
    key: "half_pixel_centers"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/concat_1"
  op: "ConcatV2"
  input: "depth_prediction/depth_prediction/depth_net/ResizeNearestNeighbor_1"
  input: "depth_prediction/depth_prediction/depth_net/cnv5b/Relu"
  input: "depth_prediction/depth_prediction/depth_net/concat_1/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\004\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.02083333395421505
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.02083333395421505
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/icnv6/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv6/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/icnv6/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/icnv6/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/icnv6/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/icnv6/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/icnv6/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1024
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv6/weights"
  input: "depth_prediction/depth_net/icnv6/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv6/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/icnv6/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/concat_1"
  input: "depth_prediction/depth_net/icnv6/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv6/BatchNorm/beta"
  input: "depth_prediction/depth_net/icnv6/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv6/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv6/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/icnv6/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv6/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 512
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv6/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/icnv6/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv6/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv6/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/Const"
  input: "depth_prediction/depth_net/icnv6/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv6/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/icnv6/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv6/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/icnv6/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv6/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.02946278266608715
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.02946278266608715
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/upcnv5/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv5/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/upcnv5/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/upcnv5/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/upcnv5/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/upcnv5/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/upcnv5/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 512
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv5/weights"
  input: "depth_prediction/depth_net/upcnv5/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv5/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/upcnv5/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\004\000\000\000\004\000\000\000\r\000\000\000\000\002\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_1"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_1/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_1/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_2"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_2/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_2/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/mul/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/mul/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/mul_1"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_2"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/stack/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 256
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/stack"
  op: "Pack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/mul_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/stack/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_3/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_3/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_3/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_3"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_3/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_3/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/strided_slice_3/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/conv2d_transpose"
  op: "Conv2DBackpropInput"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/stack"
  input: "depth_prediction/depth_net/upcnv5/weights/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv6/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv5/BatchNorm/beta"
  input: "depth_prediction/depth_net/upcnv5/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv5/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/conv2d_transpose"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/Const"
  input: "depth_prediction/depth_net/upcnv5/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv5/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/concat_2/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/concat_2"
  op: "ConcatV2"
  input: "depth_prediction/depth_prediction/depth_net/upcnv5/Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv4b/Relu"
  input: "depth_prediction/depth_prediction/depth_net/concat_2/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\002\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.02946278266608715
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.02946278266608715
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/icnv5/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv5/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/icnv5/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/icnv5/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/icnv5/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/icnv5/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/icnv5/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 512
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv5/weights"
  input: "depth_prediction/depth_net/icnv5/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv5/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/icnv5/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/concat_2"
  input: "depth_prediction/depth_net/icnv5/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv5/BatchNorm/beta"
  input: "depth_prediction/depth_net/icnv5/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv5/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv5/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/icnv5/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv5/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv5/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/icnv5/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv5/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv5/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/Const"
  input: "depth_prediction/depth_net/icnv5/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv5/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/icnv5/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv5/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/icnv5/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv5/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0416666679084301
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0416666679084301
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/upcnv4/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv4/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/upcnv4/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/upcnv4/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/upcnv4/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/upcnv4/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/upcnv4/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv4/weights"
  input: "depth_prediction/depth_net/upcnv4/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv4/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/upcnv4/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\004\000\000\000\010\000\000\000\032\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_1"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_1/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_1/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_2"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_2/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_2/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/mul/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/mul/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/mul_1"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_2"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/stack/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/stack"
  op: "Pack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/mul_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/stack/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_3/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_3/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_3/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_3"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_3/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_3/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/strided_slice_3/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/conv2d_transpose"
  op: "Conv2DBackpropInput"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/stack"
  input: "depth_prediction/depth_net/upcnv4/weights/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv5/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv4/BatchNorm/beta"
  input: "depth_prediction/depth_net/upcnv4/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv4/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/conv2d_transpose"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/Const"
  input: "depth_prediction/depth_net/upcnv4/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv4/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/concat_3/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/concat_3"
  op: "ConcatV2"
  input: "depth_prediction/depth_prediction/depth_net/upcnv4/Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv3b/Relu"
  input: "depth_prediction/depth_prediction/depth_net/concat_3/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0416666679084301
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0416666679084301
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/icnv4/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv4/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/icnv4/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/icnv4/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/icnv4/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/icnv4/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/icnv4/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv4/weights"
  input: "depth_prediction/depth_net/icnv4/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv4/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/icnv4/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/concat_3"
  input: "depth_prediction/depth_net/icnv4/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv4/BatchNorm/beta"
  input: "depth_prediction/depth_net/icnv4/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv4/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv4/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/icnv4/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv4/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv4/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/icnv4/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv4/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv4/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/Const"
  input: "depth_prediction/depth_net/icnv4/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv4/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/icnv4/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv4/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/icnv4/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv4/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp4/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp4/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0718885138630867
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp4/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0718885138630867
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp4/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/disp4/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp4/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/disp4/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/disp4/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp4/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/disp4/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/disp4/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp4/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/disp4/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/disp4/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp4/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp4/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp4/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/disp4/weights"
  input: "depth_prediction/depth_net/disp4/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp4/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp4/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/disp4/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp4/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp4/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp4/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/disp4/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp4/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/disp4/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/disp4/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp4/biases/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp4/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp4/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp4/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp4/biases/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/disp4/biases"
  input: "depth_prediction/depth_net/disp4/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp4/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp4/biases/read"
  op: "Identity"
  input: "depth_prediction/depth_net/disp4/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp4/biases"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp4/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp4/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/Relu"
  input: "depth_prediction/depth_net/disp4/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp4/BiasAdd"
  op: "BiasAdd"
  input: "depth_prediction/depth_prediction/depth_net/disp4/Conv2D"
  input: "depth_prediction/depth_net/disp4/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp4/Sigmoid"
  op: "Sigmoid"
  input: "depth_prediction/depth_prediction/depth_net/disp4/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/mul/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 10.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/disp4/Sigmoid"
  input: "depth_prediction/depth_prediction/depth_net/mul/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/add/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.009999999776482582
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/add"
  op: "AddV2"
  input: "depth_prediction/depth_prediction/depth_net/mul"
  input: "depth_prediction/depth_prediction/depth_net/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/ResizeBilinear/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: " \000\000\000h\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/ResizeBilinear"
  op: "ResizeBilinear"
  input: "depth_prediction/depth_prediction/depth_net/add"
  input: "depth_prediction/depth_prediction/depth_net/ResizeBilinear/size"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "align_corners"
    value {
      b: false
    }
  }
  attr {
    key: "half_pixel_centers"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0589255653321743
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0589255653321743
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/upcnv3/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv3/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/upcnv3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/upcnv3/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/upcnv3/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/upcnv3/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/upcnv3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv3/weights"
  input: "depth_prediction/depth_net/upcnv3/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv3/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/upcnv3/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\004\000\000\000\020\000\000\0004\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_1"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_1/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_1/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_2"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_2/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_2/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/mul/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/mul/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/mul_1"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_2"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/stack/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/stack"
  op: "Pack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/mul_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/stack/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_3/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_3/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_3/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_3"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_3/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_3/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/strided_slice_3/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/conv2d_transpose"
  op: "Conv2DBackpropInput"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/stack"
  input: "depth_prediction/depth_net/upcnv3/weights/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv4/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv3/BatchNorm/beta"
  input: "depth_prediction/depth_net/upcnv3/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv3/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/conv2d_transpose"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/Const"
  input: "depth_prediction/depth_net/upcnv3/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv3/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/concat_4/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/concat_4"
  op: "ConcatV2"
  input: "depth_prediction/depth_prediction/depth_net/upcnv3/Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv2b/Relu"
  input: "depth_prediction/depth_prediction/depth_net/ResizeBilinear"
  input: "depth_prediction/depth_prediction/depth_net/concat_4/axis"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\201\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.05877270922064781
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05877270922064781
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/icnv3/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv3/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/icnv3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/icnv3/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/icnv3/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/icnv3/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/icnv3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 129
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv3/weights"
  input: "depth_prediction/depth_net/icnv3/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv3/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/icnv3/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/concat_4"
  input: "depth_prediction/depth_net/icnv3/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv3/BatchNorm/beta"
  input: "depth_prediction/depth_net/icnv3/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv3/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv3/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/icnv3/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv3/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv3/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/icnv3/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv3/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv3/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/Const"
  input: "depth_prediction/depth_net/icnv3/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv3/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/icnv3/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv3/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/icnv3/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv3/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp3/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp3/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp3/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp3/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/disp3/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp3/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/disp3/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/disp3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp3/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/disp3/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/disp3/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp3/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/disp3/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/disp3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp3/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp3/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp3/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/disp3/weights"
  input: "depth_prediction/depth_net/disp3/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp3/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp3/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/disp3/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp3/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp3/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp3/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/disp3/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp3/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/disp3/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/disp3/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp3/biases/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp3/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp3/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp3/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp3/biases/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/disp3/biases"
  input: "depth_prediction/depth_net/disp3/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp3/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp3/biases/read"
  op: "Identity"
  input: "depth_prediction/depth_net/disp3/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp3/biases"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp3/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp3/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/Relu"
  input: "depth_prediction/depth_net/disp3/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp3/BiasAdd"
  op: "BiasAdd"
  input: "depth_prediction/depth_prediction/depth_net/disp3/Conv2D"
  input: "depth_prediction/depth_net/disp3/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp3/Sigmoid"
  op: "Sigmoid"
  input: "depth_prediction/depth_prediction/depth_net/disp3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 10.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/mul_1"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/disp3/Sigmoid"
  input: "depth_prediction/depth_prediction/depth_net/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/add_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.009999999776482582
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/add_1"
  op: "AddV2"
  input: "depth_prediction/depth_prediction/depth_net/mul_1"
  input: "depth_prediction/depth_prediction/depth_net/add_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/ResizeBilinear_1/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "@\000\000\000\320\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/ResizeBilinear_1"
  op: "ResizeBilinear"
  input: "depth_prediction/depth_prediction/depth_net/add_1"
  input: "depth_prediction/depth_prediction/depth_net/ResizeBilinear_1/size"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "align_corners"
    value {
      b: false
    }
  }
  attr {
    key: "half_pixel_centers"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0833333358168602
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0833333358168602
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/upcnv2/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv2/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/upcnv2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/upcnv2/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/upcnv2/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/upcnv2/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/upcnv2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv2/weights"
  input: "depth_prediction/depth_net/upcnv2/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv2/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/upcnv2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\004\000\000\000 \000\000\000h\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_1"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_1/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_1/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_2"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_2/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_2/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/mul/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/mul/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/mul_1"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_2"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/stack/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/stack"
  op: "Pack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/mul_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/stack/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_3/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_3/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_3/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_3"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_3/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_3/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/strided_slice_3/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/conv2d_transpose"
  op: "Conv2DBackpropInput"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/stack"
  input: "depth_prediction/depth_net/upcnv2/weights/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv3/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv2/BatchNorm/beta"
  input: "depth_prediction/depth_net/upcnv2/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv2/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/conv2d_transpose"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/Const"
  input: "depth_prediction/depth_net/upcnv2/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv2/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/concat_5/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/concat_5"
  op: "ConcatV2"
  input: "depth_prediction/depth_prediction/depth_net/upcnv2/Relu"
  input: "depth_prediction/depth_prediction/depth_net/cnv1b/Relu"
  input: "depth_prediction/depth_prediction/depth_net/ResizeBilinear_1"
  input: "depth_prediction/depth_prediction/depth_net/concat_5/axis"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000A\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.08290266990661621
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.08290266990661621
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/icnv2/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv2/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/icnv2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/icnv2/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/icnv2/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/icnv2/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/icnv2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 65
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv2/weights"
  input: "depth_prediction/depth_net/icnv2/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv2/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/icnv2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/concat_5"
  input: "depth_prediction/depth_net/icnv2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv2/BatchNorm/beta"
  input: "depth_prediction/depth_net/icnv2/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv2/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv2/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/icnv2/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv2/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv2/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/icnv2/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv2/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv2/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/Const"
  input: "depth_prediction/depth_net/icnv2/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv2/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/icnv2/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv2/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/icnv2/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv2/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp2/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp2/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14213381707668304
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp2/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14213381707668304
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp2/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/disp2/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp2/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/disp2/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/disp2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp2/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/disp2/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/disp2/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp2/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/disp2/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/disp2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp2/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp2/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp2/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/disp2/weights"
  input: "depth_prediction/depth_net/disp2/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp2/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/disp2/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp2/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp2/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp2/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/disp2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp2/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/disp2/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/disp2/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp2/biases/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp2/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp2/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp2/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp2/biases/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/disp2/biases"
  input: "depth_prediction/depth_net/disp2/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp2/biases/read"
  op: "Identity"
  input: "depth_prediction/depth_net/disp2/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp2/biases"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp2/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp2/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/Relu"
  input: "depth_prediction/depth_net/disp2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp2/BiasAdd"
  op: "BiasAdd"
  input: "depth_prediction/depth_prediction/depth_net/disp2/Conv2D"
  input: "depth_prediction/depth_net/disp2/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp2/Sigmoid"
  op: "Sigmoid"
  input: "depth_prediction/depth_prediction/depth_net/disp2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/mul_2/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 10.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/mul_2"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/disp2/Sigmoid"
  input: "depth_prediction/depth_prediction/depth_net/mul_2/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/add_2/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.009999999776482582
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/add_2"
  op: "AddV2"
  input: "depth_prediction/depth_prediction/depth_net/mul_2"
  input: "depth_prediction/depth_prediction/depth_net/add_2/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/ResizeBilinear_2/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\200\000\000\000\240\001\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/ResizeBilinear_2"
  op: "ResizeBilinear"
  input: "depth_prediction/depth_prediction/depth_net/add_2"
  input: "depth_prediction/depth_prediction/depth_net/ResizeBilinear_2/size"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "align_corners"
    value {
      b: false
    }
  }
  attr {
    key: "half_pixel_centers"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\020\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1178511306643486
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1178511306643486
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/upcnv1/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv1/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/upcnv1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/upcnv1/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/upcnv1/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/upcnv1/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/upcnv1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 16
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv1/weights"
  input: "depth_prediction/depth_net/upcnv1/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv1/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/upcnv1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\004\000\000\000@\000\000\000\320\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_1"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_1/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_1/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_2"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/Shape"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_2/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_2/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/mul/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/mul/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/mul_1"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_2"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/stack/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 16
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/stack"
  op: "Pack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/mul_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/stack/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_3/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_3/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_3/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_3"
  op: "StridedSlice"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_3/stack"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_3/stack_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/strided_slice_3/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/conv2d_transpose"
  op: "Conv2DBackpropInput"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/stack"
  input: "depth_prediction/depth_net/upcnv1/weights/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv1/BatchNorm/beta"
  input: "depth_prediction/depth_net/upcnv1/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv1/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/conv2d_transpose"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/Const"
  input: "depth_prediction/depth_net/upcnv1/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/upcnv1/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/concat_6/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/concat_6"
  op: "ConcatV2"
  input: "depth_prediction/depth_prediction/depth_net/upcnv1/Relu"
  input: "depth_prediction/depth_prediction/depth_net/ResizeBilinear_2"
  input: "depth_prediction/depth_prediction/depth_net/concat_6/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\021\000\000\000\020\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14213381707668304
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14213381707668304
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/icnv1/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv1/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/icnv1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/icnv1/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/icnv1/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/icnv1/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/icnv1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 17
        }
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv1/weights"
  input: "depth_prediction/depth_net/icnv1/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv1/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/icnv1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/concat_6"
  input: "depth_prediction/depth_net/icnv1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/BatchNorm/beta/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv1/BatchNorm/beta"
  input: "depth_prediction/depth_net/icnv1/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/BatchNorm/beta/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv1/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv1/BatchNorm/moving_mean"
  input: "depth_prediction/depth_net/icnv1/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv1/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/icnv1/BatchNorm/moving_variance"
  input: "depth_prediction/depth_net/icnv1/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/icnv1/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "depth_prediction/depth_net/icnv1/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/Const"
  input: "depth_prediction/depth_net/icnv1/BatchNorm/beta/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/Const_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv1/BatchNorm/moving_mean/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "depth_prediction/depth_net/icnv1/BatchNorm/moving_mean"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "depth_prediction/depth_net/icnv1/BatchNorm/moving_variance/read"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "depth_prediction/depth_net/icnv1/BatchNorm/moving_variance"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/icnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/icnv1/Relu"
  op: "Relu"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\020\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1980295032262802
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1980295032262802
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "depth_prediction/depth_net/disp1/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "depth_prediction/depth_net/disp1/weights/Initializer/random_uniform/max"
  input: "depth_prediction/depth_net/disp1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "depth_prediction/depth_net/disp1/weights/Initializer/random_uniform/RandomUniform"
  input: "depth_prediction/depth_net/disp1/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp1/weights/Initializer/random_uniform"
  op: "Add"
  input: "depth_prediction/depth_net/disp1/weights/Initializer/random_uniform/mul"
  input: "depth_prediction/depth_net/disp1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 16
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp1/weights/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/disp1/weights"
  input: "depth_prediction/depth_net/disp1/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp1/weights/read"
  op: "Identity"
  input: "depth_prediction/depth_net/disp1/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp1/weights"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp1/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp1/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "depth_prediction/depth_net/disp1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp1/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/disp1/kernel/Regularizer/l2_regularizer/scale"
  input: "depth_prediction/depth_prediction/depth_net/disp1/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp1/biases/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp1/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp1/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp1/biases/Assign"
  op: "Assign"
  input: "depth_prediction/depth_net/disp1/biases"
  input: "depth_prediction/depth_net/disp1/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_net/disp1/biases/read"
  op: "Identity"
  input: "depth_prediction/depth_net/disp1/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@depth_prediction/depth_net/disp1/biases"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp1/Conv2D"
  op: "Conv2D"
  input: "depth_prediction/depth_prediction/depth_net/icnv1/Relu"
  input: "depth_prediction/depth_net/disp1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp1/BiasAdd"
  op: "BiasAdd"
  input: "depth_prediction/depth_prediction/depth_net/disp1/Conv2D"
  input: "depth_prediction/depth_net/disp1/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/disp1/Sigmoid"
  op: "Sigmoid"
  input: "depth_prediction/depth_prediction/depth_net/disp1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/mul_3/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 10.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/mul_3"
  op: "Mul"
  input: "depth_prediction/depth_prediction/depth_net/disp1/Sigmoid"
  input: "depth_prediction/depth_prediction/depth_net/mul_3/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/add_3/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.009999999776482582
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/depth_net/add_3"
  op: "AddV2"
  input: "depth_prediction/depth_prediction/depth_net/mul_3"
  input: "depth_prediction/depth_prediction/depth_net/add_3/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/truediv/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "depth_prediction/depth_prediction/truediv"
  op: "RealDiv"
  input: "depth_prediction/depth_prediction/truediv/x"
  input: "depth_prediction/depth_prediction/depth_net/add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "raw_input"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_UINT8
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4
        }
        dim {
          size: 128
        }
        dim {
          size: 1248
        }
        dim {
          size: 3
        }
      }
    }
  }
}
node {
  name: "convert_image/Cast"
  op: "Cast"
  input: "raw_input"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_UINT8
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "convert_image/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.003921568859368563
      }
    }
  }
}
node {
  name: "convert_image"
  op: "Mul"
  input: "convert_image/Cast"
  input: "convert_image/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unpack_images/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "unpack_images/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000\240\001\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "unpack_images/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "unpack_images/strided_slice"
  op: "StridedSlice"
  input: "convert_image"
  input: "unpack_images/strided_slice/stack"
  input: "unpack_images/strided_slice/stack_1"
  input: "unpack_images/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 11
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 11
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "unpack_images/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000\240\001\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "unpack_images/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000@\003\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "unpack_images/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "unpack_images/strided_slice_1"
  op: "StridedSlice"
  input: "convert_image"
  input: "unpack_images/strided_slice_1/stack"
  input: "unpack_images/strided_slice_1/stack_1"
  input: "unpack_images/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 11
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 11
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "unpack_images/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000@\003\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "unpack_images/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000\340\004\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "unpack_images/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "unpack_images/strided_slice_2"
  op: "StridedSlice"
  input: "convert_image"
  input: "unpack_images/strided_slice_2/stack"
  input: "unpack_images/strided_slice_2/stack_1"
  input: "unpack_images/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 11
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 11
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "unpack_images/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "unpack_images/concat"
  op: "ConcatV2"
  input: "unpack_images/strided_slice"
  input: "unpack_images/strided_slice_1"
  input: "unpack_images/strided_slice_2"
  input: "unpack_images/concat/axis"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "pose_exp_net/cnv1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\007\000\000\000\007\000\000\000\t\000\000\000\020\000\000\000"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.06998541951179504
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.06998541951179504
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "pose_exp_net/cnv1/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "pose_exp_net/cnv1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "pose_exp_net/cnv1/weights/Initializer/random_uniform/max"
  input: "pose_exp_net/cnv1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "pose_exp_net/cnv1/weights/Initializer/random_uniform/RandomUniform"
  input: "pose_exp_net/cnv1/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv1/weights/Initializer/random_uniform"
  op: "Add"
  input: "pose_exp_net/cnv1/weights/Initializer/random_uniform/mul"
  input: "pose_exp_net/cnv1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 7
        }
        dim {
          size: 7
        }
        dim {
          size: 9
        }
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv1/weights/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv1/weights"
  input: "pose_exp_net/cnv1/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv1/weights/read"
  op: "Identity"
  input: "pose_exp_net/cnv1/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/weights"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "pose_exp_net/cnv1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/cnv1/kernel/Regularizer/l2_regularizer/scale"
  input: "egomotion_prediction/pose_exp_net/cnv1/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/Conv2D"
  op: "Conv2D"
  input: "unpack_images/concat"
  input: "pose_exp_net/cnv1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv1/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv1/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv1/BatchNorm/beta/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv1/BatchNorm/beta"
  input: "pose_exp_net/cnv1/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv1/BatchNorm/beta/read"
  op: "Identity"
  input: "pose_exp_net/cnv1/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv1/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv1/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv1/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv1/BatchNorm/moving_mean"
  input: "pose_exp_net/cnv1/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv1/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "pose_exp_net/cnv1/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv1/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 16
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv1/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 16
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv1/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv1/BatchNorm/moving_variance"
  input: "pose_exp_net/cnv1/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv1/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "pose_exp_net/cnv1/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "egomotion_prediction/pose_exp_net/cnv1/Conv2D"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/Const"
  input: "pose_exp_net/cnv1/BatchNorm/beta/read"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/Const_1"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg/sub/x"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "pose_exp_net/cnv1/BatchNorm/moving_mean/read"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg/sub_1"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "pose_exp_net/cnv1/BatchNorm/moving_mean"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "pose_exp_net/cnv1/BatchNorm/moving_variance/read"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "pose_exp_net/cnv1/BatchNorm/moving_variance"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv1/Relu"
  op: "Relu"
  input: "egomotion_prediction/pose_exp_net/cnv1/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "pose_exp_net/cnv2/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000\020\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv2/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0707106813788414
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv2/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0707106813788414
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv2/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "pose_exp_net/cnv2/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "pose_exp_net/cnv2/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "pose_exp_net/cnv2/weights/Initializer/random_uniform/max"
  input: "pose_exp_net/cnv2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv2/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "pose_exp_net/cnv2/weights/Initializer/random_uniform/RandomUniform"
  input: "pose_exp_net/cnv2/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv2/weights/Initializer/random_uniform"
  op: "Add"
  input: "pose_exp_net/cnv2/weights/Initializer/random_uniform/mul"
  input: "pose_exp_net/cnv2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv2/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 16
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv2/weights/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv2/weights"
  input: "pose_exp_net/cnv2/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv2/weights/read"
  op: "Identity"
  input: "pose_exp_net/cnv2/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/weights"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "pose_exp_net/cnv2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/cnv2/kernel/Regularizer/l2_regularizer/scale"
  input: "egomotion_prediction/pose_exp_net/cnv2/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/Conv2D"
  op: "Conv2D"
  input: "egomotion_prediction/pose_exp_net/cnv1/Relu"
  input: "pose_exp_net/cnv2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv2/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv2/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv2/BatchNorm/beta/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv2/BatchNorm/beta"
  input: "pose_exp_net/cnv2/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv2/BatchNorm/beta/read"
  op: "Identity"
  input: "pose_exp_net/cnv2/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv2/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv2/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv2/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv2/BatchNorm/moving_mean"
  input: "pose_exp_net/cnv2/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv2/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "pose_exp_net/cnv2/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv2/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv2/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv2/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv2/BatchNorm/moving_variance"
  input: "pose_exp_net/cnv2/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv2/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "pose_exp_net/cnv2/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "egomotion_prediction/pose_exp_net/cnv2/Conv2D"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/Const"
  input: "pose_exp_net/cnv2/BatchNorm/beta/read"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/Const_1"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg/sub/x"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "pose_exp_net/cnv2/BatchNorm/moving_mean/read"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg/sub_1"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "pose_exp_net/cnv2/BatchNorm/moving_mean"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "pose_exp_net/cnv2/BatchNorm/moving_variance/read"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "pose_exp_net/cnv2/BatchNorm/moving_variance"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv2/Relu"
  op: "Relu"
  input: "egomotion_prediction/pose_exp_net/cnv2/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "pose_exp_net/cnv3/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv3/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0833333358168602
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv3/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0833333358168602
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv3/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "pose_exp_net/cnv3/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "pose_exp_net/cnv3/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "pose_exp_net/cnv3/weights/Initializer/random_uniform/max"
  input: "pose_exp_net/cnv3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv3/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "pose_exp_net/cnv3/weights/Initializer/random_uniform/RandomUniform"
  input: "pose_exp_net/cnv3/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv3/weights/Initializer/random_uniform"
  op: "Add"
  input: "pose_exp_net/cnv3/weights/Initializer/random_uniform/mul"
  input: "pose_exp_net/cnv3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv3/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv3/weights/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv3/weights"
  input: "pose_exp_net/cnv3/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv3/weights/read"
  op: "Identity"
  input: "pose_exp_net/cnv3/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/weights"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "pose_exp_net/cnv3/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/cnv3/kernel/Regularizer/l2_regularizer/scale"
  input: "egomotion_prediction/pose_exp_net/cnv3/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/Conv2D"
  op: "Conv2D"
  input: "egomotion_prediction/pose_exp_net/cnv2/Relu"
  input: "pose_exp_net/cnv3/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv3/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv3/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv3/BatchNorm/beta/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv3/BatchNorm/beta"
  input: "pose_exp_net/cnv3/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv3/BatchNorm/beta/read"
  op: "Identity"
  input: "pose_exp_net/cnv3/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv3/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv3/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv3/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv3/BatchNorm/moving_mean"
  input: "pose_exp_net/cnv3/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv3/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "pose_exp_net/cnv3/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv3/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv3/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv3/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv3/BatchNorm/moving_variance"
  input: "pose_exp_net/cnv3/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv3/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "pose_exp_net/cnv3/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "egomotion_prediction/pose_exp_net/cnv3/Conv2D"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/Const"
  input: "pose_exp_net/cnv3/BatchNorm/beta/read"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/Const_1"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg/sub/x"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "pose_exp_net/cnv3/BatchNorm/moving_mean/read"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg/sub_1"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "pose_exp_net/cnv3/BatchNorm/moving_mean"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "pose_exp_net/cnv3/BatchNorm/moving_variance/read"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "pose_exp_net/cnv3/BatchNorm/moving_variance"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv3/Relu"
  op: "Relu"
  input: "egomotion_prediction/pose_exp_net/cnv3/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "pose_exp_net/cnv4/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv4/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0589255653321743
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv4/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0589255653321743
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv4/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "pose_exp_net/cnv4/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "pose_exp_net/cnv4/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "pose_exp_net/cnv4/weights/Initializer/random_uniform/max"
  input: "pose_exp_net/cnv4/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv4/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "pose_exp_net/cnv4/weights/Initializer/random_uniform/RandomUniform"
  input: "pose_exp_net/cnv4/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv4/weights/Initializer/random_uniform"
  op: "Add"
  input: "pose_exp_net/cnv4/weights/Initializer/random_uniform/mul"
  input: "pose_exp_net/cnv4/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv4/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv4/weights/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv4/weights"
  input: "pose_exp_net/cnv4/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv4/weights/read"
  op: "Identity"
  input: "pose_exp_net/cnv4/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/weights"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "pose_exp_net/cnv4/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/cnv4/kernel/Regularizer/l2_regularizer/scale"
  input: "egomotion_prediction/pose_exp_net/cnv4/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/Conv2D"
  op: "Conv2D"
  input: "egomotion_prediction/pose_exp_net/cnv3/Relu"
  input: "pose_exp_net/cnv4/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv4/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv4/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv4/BatchNorm/beta/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv4/BatchNorm/beta"
  input: "pose_exp_net/cnv4/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv4/BatchNorm/beta/read"
  op: "Identity"
  input: "pose_exp_net/cnv4/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv4/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv4/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv4/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv4/BatchNorm/moving_mean"
  input: "pose_exp_net/cnv4/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv4/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "pose_exp_net/cnv4/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv4/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv4/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv4/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv4/BatchNorm/moving_variance"
  input: "pose_exp_net/cnv4/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv4/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "pose_exp_net/cnv4/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "egomotion_prediction/pose_exp_net/cnv4/Conv2D"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/Const"
  input: "pose_exp_net/cnv4/BatchNorm/beta/read"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/Const_1"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg/sub/x"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "pose_exp_net/cnv4/BatchNorm/moving_mean/read"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg/sub_1"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "pose_exp_net/cnv4/BatchNorm/moving_mean"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "pose_exp_net/cnv4/BatchNorm/moving_variance/read"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "pose_exp_net/cnv4/BatchNorm/moving_variance"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv4/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv4/Relu"
  op: "Relu"
  input: "egomotion_prediction/pose_exp_net/cnv4/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "pose_exp_net/cnv5/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv5/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0416666679084301
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv5/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0416666679084301
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv5/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "pose_exp_net/cnv5/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "pose_exp_net/cnv5/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "pose_exp_net/cnv5/weights/Initializer/random_uniform/max"
  input: "pose_exp_net/cnv5/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv5/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "pose_exp_net/cnv5/weights/Initializer/random_uniform/RandomUniform"
  input: "pose_exp_net/cnv5/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv5/weights/Initializer/random_uniform"
  op: "Add"
  input: "pose_exp_net/cnv5/weights/Initializer/random_uniform/mul"
  input: "pose_exp_net/cnv5/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv5/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv5/weights/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv5/weights"
  input: "pose_exp_net/cnv5/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv5/weights/read"
  op: "Identity"
  input: "pose_exp_net/cnv5/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/weights"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "pose_exp_net/cnv5/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/cnv5/kernel/Regularizer/l2_regularizer/scale"
  input: "egomotion_prediction/pose_exp_net/cnv5/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/Conv2D"
  op: "Conv2D"
  input: "egomotion_prediction/pose_exp_net/cnv4/Relu"
  input: "pose_exp_net/cnv5/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv5/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv5/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv5/BatchNorm/beta/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv5/BatchNorm/beta"
  input: "pose_exp_net/cnv5/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv5/BatchNorm/beta/read"
  op: "Identity"
  input: "pose_exp_net/cnv5/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv5/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv5/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv5/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv5/BatchNorm/moving_mean"
  input: "pose_exp_net/cnv5/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv5/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "pose_exp_net/cnv5/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv5/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "pose_exp_net/cnv5/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/cnv5/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "pose_exp_net/cnv5/BatchNorm/moving_variance"
  input: "pose_exp_net/cnv5/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/cnv5/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "pose_exp_net/cnv5/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "egomotion_prediction/pose_exp_net/cnv5/Conv2D"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/Const"
  input: "pose_exp_net/cnv5/BatchNorm/beta/read"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/Const_1"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg/sub/x"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "pose_exp_net/cnv5/BatchNorm/moving_mean/read"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg/sub_1"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "pose_exp_net/cnv5/BatchNorm/moving_mean"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "pose_exp_net/cnv5/BatchNorm/moving_variance/read"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "pose_exp_net/cnv5/BatchNorm/moving_variance"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/cnv5/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/cnv5/Relu"
  op: "Relu"
  input: "egomotion_prediction/pose_exp_net/cnv5/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03608439117670059
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03608439117670059
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "pose_exp_net/pose/cnv6/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "pose_exp_net/pose/cnv6/weights/Initializer/random_uniform/max"
  input: "pose_exp_net/pose/cnv6/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "pose_exp_net/pose/cnv6/weights/Initializer/random_uniform/RandomUniform"
  input: "pose_exp_net/pose/cnv6/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/weights/Initializer/random_uniform"
  op: "Add"
  input: "pose_exp_net/pose/cnv6/weights/Initializer/random_uniform/mul"
  input: "pose_exp_net/pose/cnv6/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/weights/Assign"
  op: "Assign"
  input: "pose_exp_net/pose/cnv6/weights"
  input: "pose_exp_net/pose/cnv6/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/weights/read"
  op: "Identity"
  input: "pose_exp_net/pose/cnv6/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/weights"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "pose_exp_net/pose/cnv6/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/kernel/Regularizer/l2_regularizer/scale"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/Conv2D"
  op: "Conv2D"
  input: "egomotion_prediction/pose_exp_net/cnv5/Relu"
  input: "pose_exp_net/pose/cnv6/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/BatchNorm/beta/Assign"
  op: "Assign"
  input: "pose_exp_net/pose/cnv6/BatchNorm/beta"
  input: "pose_exp_net/pose/cnv6/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/BatchNorm/beta/read"
  op: "Identity"
  input: "pose_exp_net/pose/cnv6/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "pose_exp_net/pose/cnv6/BatchNorm/moving_mean"
  input: "pose_exp_net/pose/cnv6/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "pose_exp_net/pose/cnv6/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "pose_exp_net/pose/cnv6/BatchNorm/moving_variance"
  input: "pose_exp_net/pose/cnv6/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv6/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "pose_exp_net/pose/cnv6/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/Conv2D"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/Const"
  input: "pose_exp_net/pose/cnv6/BatchNorm/beta/read"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/Const_1"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg/sub/x"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "pose_exp_net/pose/cnv6/BatchNorm/moving_mean/read"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg/sub_1"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "pose_exp_net/pose/cnv6/BatchNorm/moving_mean"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "pose_exp_net/pose/cnv6/BatchNorm/moving_variance/read"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "pose_exp_net/pose/cnv6/BatchNorm/moving_variance"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv6/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv6/Relu"
  op: "Relu"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03608439117670059
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03608439117670059
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "pose_exp_net/pose/cnv7/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "pose_exp_net/pose/cnv7/weights/Initializer/random_uniform/max"
  input: "pose_exp_net/pose/cnv7/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "pose_exp_net/pose/cnv7/weights/Initializer/random_uniform/RandomUniform"
  input: "pose_exp_net/pose/cnv7/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/weights/Initializer/random_uniform"
  op: "Add"
  input: "pose_exp_net/pose/cnv7/weights/Initializer/random_uniform/mul"
  input: "pose_exp_net/pose/cnv7/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/weights/Assign"
  op: "Assign"
  input: "pose_exp_net/pose/cnv7/weights"
  input: "pose_exp_net/pose/cnv7/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/weights/read"
  op: "Identity"
  input: "pose_exp_net/pose/cnv7/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/weights"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "pose_exp_net/pose/cnv7/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/kernel/Regularizer/l2_regularizer/scale"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/Conv2D"
  op: "Conv2D"
  input: "egomotion_prediction/pose_exp_net/pose/cnv6/Relu"
  input: "pose_exp_net/pose/cnv7/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/BatchNorm/beta/Assign"
  op: "Assign"
  input: "pose_exp_net/pose/cnv7/BatchNorm/beta"
  input: "pose_exp_net/pose/cnv7/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/BatchNorm/beta/read"
  op: "Identity"
  input: "pose_exp_net/pose/cnv7/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "pose_exp_net/pose/cnv7/BatchNorm/moving_mean"
  input: "pose_exp_net/pose/cnv7/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "pose_exp_net/pose/cnv7/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "pose_exp_net/pose/cnv7/BatchNorm/moving_variance"
  input: "pose_exp_net/pose/cnv7/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/pose/cnv7/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "pose_exp_net/pose/cnv7/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/FusedBatchNormV3"
  op: "FusedBatchNormV3"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/Conv2D"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/Const"
  input: "pose_exp_net/pose/cnv7/BatchNorm/beta/read"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/Const_1"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "U"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000474974513
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg/sub/x"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "pose_exp_net/pose/cnv7/BatchNorm/moving_mean/read"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/FusedBatchNormV3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg/sub_1"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "pose_exp_net/pose/cnv7/BatchNorm/moving_mean"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "pose_exp_net/pose/cnv7/BatchNorm/moving_variance/read"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/FusedBatchNormV3:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "pose_exp_net/pose/cnv7/BatchNorm/moving_variance"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/cnv7/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/cnv7/Relu"
  op: "Relu"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/BatchNorm/FusedBatchNormV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "pose_exp_net/pose/pred/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/pred/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\001\000\000\014\000\000\000"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/pred/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/pred/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14962640404701233
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/pred/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/pred/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14962640404701233
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/pred/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "pose_exp_net/pose/pred/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/pred/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "pose_exp_net/pose/pred/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "pose_exp_net/pose/pred/weights/Initializer/random_uniform/max"
  input: "pose_exp_net/pose/pred/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/pred/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/pred/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "pose_exp_net/pose/pred/weights/Initializer/random_uniform/RandomUniform"
  input: "pose_exp_net/pose/pred/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/pred/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/pred/weights/Initializer/random_uniform"
  op: "Add"
  input: "pose_exp_net/pose/pred/weights/Initializer/random_uniform/mul"
  input: "pose_exp_net/pose/pred/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/pred/weights"
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/pred/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/pred/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 256
        }
        dim {
          size: 12
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/pose/pred/weights/Assign"
  op: "Assign"
  input: "pose_exp_net/pose/pred/weights"
  input: "pose_exp_net/pose/pred/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/pred/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/pose/pred/weights/read"
  op: "Identity"
  input: "pose_exp_net/pose/pred/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/pred/weights"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/pred/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/pred/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "pose_exp_net/pose/pred/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/pred/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/pose/pred/kernel/Regularizer/l2_regularizer/scale"
  input: "egomotion_prediction/pose_exp_net/pose/pred/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "pose_exp_net/pose/pred/biases/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/pred/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 12
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "pose_exp_net/pose/pred/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/pred/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 12
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "pose_exp_net/pose/pred/biases/Assign"
  op: "Assign"
  input: "pose_exp_net/pose/pred/biases"
  input: "pose_exp_net/pose/pred/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/pred/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "pose_exp_net/pose/pred/biases/read"
  op: "Identity"
  input: "pose_exp_net/pose/pred/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@pose_exp_net/pose/pred/biases"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/pred/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/pred/Conv2D"
  op: "Conv2D"
  input: "egomotion_prediction/pose_exp_net/pose/cnv7/Relu"
  input: "pose_exp_net/pose/pred/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/pred/BiasAdd"
  op: "BiasAdd"
  input: "egomotion_prediction/pose_exp_net/pose/pred/Conv2D"
  input: "pose_exp_net/pose/pred/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/Mean"
  op: "Mean"
  input: "egomotion_prediction/pose_exp_net/pose/pred/BiasAdd"
  input: "egomotion_prediction/pose_exp_net/pose/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\377\377\377\377\002\000\000\000\006\000\000\000"
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/Reshape"
  op: "Reshape"
  input: "egomotion_prediction/pose_exp_net/pose/Mean"
  input: "egomotion_prediction/pose_exp_net/pose/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.009999999776482582
      }
    }
  }
}
node {
  name: "egomotion_prediction/pose_exp_net/pose/mul"
  op: "Mul"
  input: "egomotion_prediction/pose_exp_net/pose/mul/x"
  input: "egomotion_prediction/pose_exp_net/pose/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "init"
  op: "NoOp"
  input: "^depth_prediction/depth_net/cnv1/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/cnv1/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/cnv1/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/cnv1/weights/Assign"
  input: "^depth_prediction/depth_net/cnv1b/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/cnv1b/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/cnv1b/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/cnv1b/weights/Assign"
  input: "^depth_prediction/depth_net/cnv2/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/cnv2/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/cnv2/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/cnv2/weights/Assign"
  input: "^depth_prediction/depth_net/cnv2b/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/cnv2b/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/cnv2b/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/cnv2b/weights/Assign"
  input: "^depth_prediction/depth_net/cnv3/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/cnv3/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/cnv3/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/cnv3/weights/Assign"
  input: "^depth_prediction/depth_net/cnv3b/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/cnv3b/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/cnv3b/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/cnv3b/weights/Assign"
  input: "^depth_prediction/depth_net/cnv4/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/cnv4/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/cnv4/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/cnv4/weights/Assign"
  input: "^depth_prediction/depth_net/cnv4b/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/cnv4b/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/cnv4b/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/cnv4b/weights/Assign"
  input: "^depth_prediction/depth_net/cnv5/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/cnv5/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/cnv5/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/cnv5/weights/Assign"
  input: "^depth_prediction/depth_net/cnv5b/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/cnv5b/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/cnv5b/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/cnv5b/weights/Assign"
  input: "^depth_prediction/depth_net/cnv6/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/cnv6/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/cnv6/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/cnv6/weights/Assign"
  input: "^depth_prediction/depth_net/cnv6b/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/cnv6b/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/cnv6b/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/cnv6b/weights/Assign"
  input: "^depth_prediction/depth_net/cnv7/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/cnv7/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/cnv7/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/cnv7/weights/Assign"
  input: "^depth_prediction/depth_net/cnv7b/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/cnv7b/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/cnv7b/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/cnv7b/weights/Assign"
  input: "^depth_prediction/depth_net/disp1/biases/Assign"
  input: "^depth_prediction/depth_net/disp1/weights/Assign"
  input: "^depth_prediction/depth_net/disp2/biases/Assign"
  input: "^depth_prediction/depth_net/disp2/weights/Assign"
  input: "^depth_prediction/depth_net/disp3/biases/Assign"
  input: "^depth_prediction/depth_net/disp3/weights/Assign"
  input: "^depth_prediction/depth_net/disp4/biases/Assign"
  input: "^depth_prediction/depth_net/disp4/weights/Assign"
  input: "^depth_prediction/depth_net/icnv1/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/icnv1/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/icnv1/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/icnv1/weights/Assign"
  input: "^depth_prediction/depth_net/icnv2/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/icnv2/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/icnv2/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/icnv2/weights/Assign"
  input: "^depth_prediction/depth_net/icnv3/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/icnv3/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/icnv3/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/icnv3/weights/Assign"
  input: "^depth_prediction/depth_net/icnv4/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/icnv4/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/icnv4/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/icnv4/weights/Assign"
  input: "^depth_prediction/depth_net/icnv5/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/icnv5/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/icnv5/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/icnv5/weights/Assign"
  input: "^depth_prediction/depth_net/icnv6/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/icnv6/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/icnv6/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/icnv6/weights/Assign"
  input: "^depth_prediction/depth_net/icnv7/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/icnv7/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/icnv7/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/icnv7/weights/Assign"
  input: "^depth_prediction/depth_net/upcnv1/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/upcnv1/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/upcnv1/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/upcnv1/weights/Assign"
  input: "^depth_prediction/depth_net/upcnv2/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/upcnv2/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/upcnv2/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/upcnv2/weights/Assign"
  input: "^depth_prediction/depth_net/upcnv3/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/upcnv3/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/upcnv3/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/upcnv3/weights/Assign"
  input: "^depth_prediction/depth_net/upcnv4/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/upcnv4/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/upcnv4/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/upcnv4/weights/Assign"
  input: "^depth_prediction/depth_net/upcnv5/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/upcnv5/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/upcnv5/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/upcnv5/weights/Assign"
  input: "^depth_prediction/depth_net/upcnv6/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/upcnv6/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/upcnv6/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/upcnv6/weights/Assign"
  input: "^depth_prediction/depth_net/upcnv7/BatchNorm/beta/Assign"
  input: "^depth_prediction/depth_net/upcnv7/BatchNorm/moving_mean/Assign"
  input: "^depth_prediction/depth_net/upcnv7/BatchNorm/moving_variance/Assign"
  input: "^depth_prediction/depth_net/upcnv7/weights/Assign"
  input: "^pose_exp_net/cnv1/BatchNorm/beta/Assign"
  input: "^pose_exp_net/cnv1/BatchNorm/moving_mean/Assign"
  input: "^pose_exp_net/cnv1/BatchNorm/moving_variance/Assign"
  input: "^pose_exp_net/cnv1/weights/Assign"
  input: "^pose_exp_net/cnv2/BatchNorm/beta/Assign"
  input: "^pose_exp_net/cnv2/BatchNorm/moving_mean/Assign"
  input: "^pose_exp_net/cnv2/BatchNorm/moving_variance/Assign"
  input: "^pose_exp_net/cnv2/weights/Assign"
  input: "^pose_exp_net/cnv3/BatchNorm/beta/Assign"
  input: "^pose_exp_net/cnv3/BatchNorm/moving_mean/Assign"
  input: "^pose_exp_net/cnv3/BatchNorm/moving_variance/Assign"
  input: "^pose_exp_net/cnv3/weights/Assign"
  input: "^pose_exp_net/cnv4/BatchNorm/beta/Assign"
  input: "^pose_exp_net/cnv4/BatchNorm/moving_mean/Assign"
  input: "^pose_exp_net/cnv4/BatchNorm/moving_variance/Assign"
  input: "^pose_exp_net/cnv4/weights/Assign"
  input: "^pose_exp_net/cnv5/BatchNorm/beta/Assign"
  input: "^pose_exp_net/cnv5/BatchNorm/moving_mean/Assign"
  input: "^pose_exp_net/cnv5/BatchNorm/moving_variance/Assign"
  input: "^pose_exp_net/cnv5/weights/Assign"
  input: "^pose_exp_net/pose/cnv6/BatchNorm/beta/Assign"
  input: "^pose_exp_net/pose/cnv6/BatchNorm/moving_mean/Assign"
  input: "^pose_exp_net/pose/cnv6/BatchNorm/moving_variance/Assign"
  input: "^pose_exp_net/pose/cnv6/weights/Assign"
  input: "^pose_exp_net/pose/cnv7/BatchNorm/beta/Assign"
  input: "^pose_exp_net/pose/cnv7/BatchNorm/moving_mean/Assign"
  input: "^pose_exp_net/pose/cnv7/BatchNorm/moving_variance/Assign"
  input: "^pose_exp_net/pose/cnv7/weights/Assign"
  input: "^pose_exp_net/pose/pred/biases/Assign"
  input: "^pose_exp_net/pose/pred/weights/Assign"
}
versions {
  producer: 134
}
