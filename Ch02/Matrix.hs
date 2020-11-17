module Matrix where

import Numeric.LinearAlgebra
import Prelude hiding ((<>))

-- example 2
a,b :: Matrix Double
a = (4><3) [1,0,4
           ,2,1,1
           ,3,1,0
           ,0,2,2
           ]

b = (3><2) [2,4
           ,1,1
           ,3,0
           ]

c = a <> b

