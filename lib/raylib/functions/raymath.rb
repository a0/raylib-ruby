module Raylib
  #####################################################################################
  # raymath.h
  #####################################################################################

  #----------------------------------------------------------------------------------
  # Module Functions Definition - Utils math
  #----------------------------------------------------------------------------------

  attach_function :Clamp, %i[float float float], :float
  attach_function :Lerp, %i[float float float], :float

  #----------------------------------------------------------------------------------
  # Module Functions Definition - Vector2 math
  #----------------------------------------------------------------------------------

  attach_function :Vector2Zero, [], Vector2.by_value                                                          # Matrix#zero
  attach_function :Vector2One, [], Vector2.by_value                                                           # Matrix#one
  attach_function :Vector2Add, [Vector2.by_value, Vector2.by_value], Vector2.by_value                         # Matrix#+
  attach_function :Vector2Subtract, [Vector2.by_value, Vector2.by_value], Vector2.by_value                    # Matrix#-
  attach_function :Vector2Length, [Vector2.by_value], :float                                                  # Matrix#length
  attach_function :Vector2DotProduct, [Vector2.by_value, Vector2.by_value], :float                            # Matrix#dot_product
  attach_function :Vector2Distance, [Vector2.by_value, Vector2.by_value], :float                              # Matrix#distance
  attach_function :Vector2Angle, [Vector2.by_value, Vector2.by_value], :float                                 # Matrix#angle
  attach_function :Vector2Scale, [Vector2.by_value, :float], Vector2.by_value                                 # Matrix#scale
  attach_function :Vector2MultiplyV, [Vector2.by_value, Vector2.by_value], Vector2.by_value                   # Matrix#*
  attach_function :Vector2Negate, [Vector2.by_value], Vector2.by_value                                        # Matrix#negate
  attach_function :Vector2Divide, [Vector2.by_value, :float], Vector2.by_value                                # Matrix#divide
  attach_function :Vector2DivideV, [Vector2.by_value, Vector2.by_value], Vector2.by_value                     # Matrix#/
  attach_function :Vector2Normalize, [Vector2.by_value], Vector2.by_value                                     # Matrix#normalize
  attach_function :Vector2Lerp, [Vector2.by_value, Vector2.by_value, :float], Vector2.by_value                # Matrix#lerp

  #----------------------------------------------------------------------------------
  # Module Functions Definition - Vector3 math
  #----------------------------------------------------------------------------------

  attach_function :Vector3Zero, [], Vector3.by_value                                                          # Vector3#zero
  attach_function :Vector3One, [], Vector3.by_value                                                           # Vector3#one
  attach_function :Vector3Add, [Vector3.by_value, Vector3.by_value], Vector3.by_value                         # Vector3#+
  attach_function :Vector3Subtract, [Vector3.by_value, Vector3.by_value], Vector3.by_value                    # Vector3#-
  attach_function :Vector3Multiply, [Vector3.by_value, :float], Vector3.by_value                              # Vector3#multiply
  attach_function :Vector3MultiplyV, [Vector3.by_value, Vector3.by_value], Vector3.by_value                   # Vector3#*
  attach_function :Vector3CrossProduct, [Vector3.by_value, Vector3.by_value], Vector3.by_value                # Vector3#cross_product
  attach_function :Vector3Perpendicular, [Vector3.by_value], Vector3.by_value                                 # Vector3#perpendicular
  attach_function :Vector3Length, [Vector3.by_value], :float                                                  # Vector3#length
  attach_function :Vector3DotProduct, [Vector3.by_value, Vector3.by_value], :float                            # Vector3#dot_product
  attach_function :Vector3Distance, [Vector3.by_value, Vector3.by_value], :float                              # Vector3#distance
  attach_function :Vector3Scale, [Vector3.by_value, :float], Vector3.by_value                                 # Vector3#scale
  attach_function :Vector3Negate, [Vector3.by_value], Vector3.by_value                                        # Vector3#negate
  attach_function :Vector3Divide, [Vector3.by_value, :float], Vector3.by_value                                # Vector3#divide
  attach_function :Vector3DivideV, [Vector3.by_value, Vector3.by_value], Vector3.by_value                     # Vector3#/
  attach_function :Vector3Normalize, [Vector3.by_value], Vector3.by_value                                     # Vector3#normalize
  attach_function :Vector3OrthoNormalize, [Vector3.ptr, Vector3.ptr], :void                                   # Vector3#ortho_normalize
  attach_function :Vector3Transform, [Vector3.by_value, Matrix.by_value], Vector3.by_value                    # Vector3#transform
  attach_function :Vector3RotateByQuaternion, [Vector3.by_value, Quaternion.by_value], Vector3.by_value       # Vector3#rotate_by
  attach_function :Vector3Lerp, [Vector3.by_value, Vector3.by_value, :float], Vector3.by_value                # Vector3#lerp
  attach_function :Vector3Reflect, [Vector3.by_value, Vector3.by_value], Vector3.by_value                     # Vector3#reflect
  attach_function :Vector3Min, [Vector3.by_value, Vector3.by_value], Vector3.by_value                         # Vector3#min
  attach_function :Vector3Max, [Vector3.by_value, Vector3.by_value], Vector3.by_value                         # Vector3#max
  attach_function :Vector3Barycenter, [Vector3.by_value, Vector3.by_value, Vector3.by_value, Vector3.by_value], Vector3.by_value # Vector3#barycenter
  attach_function :Vector3ToFloatV, [Vector3.by_value], Float3.by_value # Vector3#to_float3

  #----------------------------------------------------------------------------------
  # Module Functions Definition - Matrix math
  #----------------------------------------------------------------------------------

  attach_function :MatrixDeterminant, [Matrix.by_value], :float                                               # Matrix#determinant
  attach_function :MatrixTrace, [Matrix.by_value], :float                                                     # Matrix#trace
  attach_function :MatrixTranspose, [Matrix.by_value], Matrix.by_value                                        # Matrix#transpose
  attach_function :MatrixInvert, [Matrix.by_value], Matrix.by_value                                           # Matrix#invert
  attach_function :MatrixNormalize, [Matrix.by_value], Matrix.by_value                                        # Matrix#normalize
  attach_function :MatrixIdentity, [], Matrix.by_value                                                        # Matrix#identity
  attach_function :MatrixAdd, [Matrix.by_value, Matrix.by_value], Matrix.by_value                             # Matrix#+
  attach_function :MatrixSubtract, [Matrix.by_value, Matrix.by_value], Matrix.by_value                        # Matrix#-
  attach_function :MatrixTranslate, [Vector3.by_value, :float], Matrix.by_value                               # Matrix#translate
  attach_function :MatrixRotate, %i[float float float], Matrix.by_value                                       # Matrix#rotate
  attach_function :MatrixRotateX, %i[float], Matrix.by_value                                                  # Matrix#rotate_x
  attach_function :MatrixRotateY, %i[float], Matrix.by_value                                                  # Matrix#rotate_y
  attach_function :MatrixRotateZ, %i[float], Matrix.by_value                                                  # Matrix#rotate_z
  attach_function :MatrixScale, %i[float float float], Matrix.by_value                                        # Matrix#scale
  attach_function :MatrixMultiply, [Matrix.by_value, Matrix.by_value], Matrix.by_value                        # Matrix#multiply
  attach_function :MatrixFrustum, %i[double double double double double double], Matrix.by_value              # Matrix#frustrum
  attach_function :MatrixPerspective, %i[double double double double], Matrix.by_value                        # Matrix#perspective
  attach_function :MatrixOrtho, %i[double double double double double double], Matrix.by_value                # Matrix#ortho
  attach_function :MatrixLookAt, [Vector3.by_value, Vector3.by_value, Vector3.by_value], Matrix.by_value      # Matrix#look_at
  attach_function :MatrixToFloatV, [Matrix.by_value], Float16.by_value                                        # Matrix#to_float16

  #----------------------------------------------------------------------------------
  # Module Functions Definition - Quaternion math
  #----------------------------------------------------------------------------------

  attach_function :QuaternionIdentity, [], Quaternion.by_value                                                # Vector4#identity
  attach_function :QuaternionLength, [Quaternion.by_value], :float                                            # Vector4#length
  attach_function :QuaternionNormalize, [Quaternion.by_value], Quaternion.by_value                            # Vector4#normalize
  attach_function :QuaternionInvert, [Quaternion.by_value], Quaternion.by_value                               # Vector4#invert
  attach_function :QuaternionMultiply, [Quaternion.by_value, Quaternion.by_value], Quaternion.by_value        # Vector4#*
  attach_function :QuaternionLerp, [Quaternion.by_value, Quaternion.by_value, :float], Quaternion.by_value    # Vector4#lerp
  attach_function :QuaternionNlerp, [Quaternion.by_value, Quaternion.by_value, :float], Quaternion.by_value   # Vector4#nlerp
  attach_function :QuaternionSlerp, [Quaternion.by_value, Quaternion.by_value, :float], Quaternion.by_value   # Vector4#slerp
  attach_function :QuaternionFromVector3ToVector3, [Vector3.by_value, Vector3.by_value], Quaternion.by_value  # Vector3#to_quaternion_vector3
  attach_function :QuaternionFromMatrix, [Matrix.by_value], Quaternion.by_value                               # Matrix#to_quaternion
  attach_function :QuaternionToMatrix, [Quaternion.by_value], Matrix.by_value                                 # Vector4#to_matrix
  attach_function :QuaternionFromAxisAngle, [Vector3.by_value, :float], Quaternion.by_value                   # Vector3#to_quaternion_angle
  attach_function :QuaternionToAxisAngle, [Quaternion.by_value, Vector3.ptr, FloatPtr.ptr], :void             # Vector4#axis_angle
  attach_function :QuaternionFromEuler, %i[float float float], Quaternion.by_value                            # Vector4#from_euler
  attach_function :QuaternionToEuler, [Quaternion.by_value], Vector3.by_value                                 # Vector4#to_euler
  attach_function :QuaternionTransform, [Quaternion.by_value, Matrix.by_value], Quaternion.by_value           # Vector4#transform
end
