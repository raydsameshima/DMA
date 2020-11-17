module Commutator where

import Numeric.LinearAlgebra
import Prelude hiding ((<>))

commutator :: Matrix Double -> Matrix Double -> Matrix Double
commutator a b = (a <> b) - (b <> a)

a,b,c :: Matrix Double
a = (2><2) [1,1
           ,2,1]
b = (2><2) [2,1
           ,1,1]

c = commutator a b
