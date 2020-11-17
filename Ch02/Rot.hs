module Rot where

-- https://lqtmirage.hatenablog.com/entry/2018/07/12/232852
-- http://dis.um.es/~alberto/hmatrix/hmatrixtut.html

import Prelude hiding ((<>))
import Numeric.LinearAlgebra 


rotX, rotY, rotZ 
  :: Double -> Matrix R
rotX t = (3><3) 
  [1.0, 0.0,    0.0
  ,0.0, cos t,  sin t
  ,0.0, -sin t, cos t
  ]
rotY t = (3><3) 
  [cos t,  0.0, sin t
  ,0.0,    1.0, 0.0
  ,-sin t, 0.0, cos t
  ]
                   
rotZ t = (3><3) 
  [cos t, -sin t, 0.0
  ,sin t, cos t,  0.0
  ,0.0,   0.0,    1.0
  ]

v,w :: Vector Double
v = vector [1.0, 1.0, 1.0]

w = (rotX pi <> rotY pi <> rotZ pi) #> v
