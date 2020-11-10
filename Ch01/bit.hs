-- bit.hs

import Data.Bits

main = do
  putStrLn "bit operations (or,and, xor): "
  
  print [p .|. q | p <- bv, q <- bv]
  print [p .&. q | p <- bv, q <- bv]
  print [p `xor` q | p <- bv, q <- bv]

bv :: [Int]
bv = [0,1]


