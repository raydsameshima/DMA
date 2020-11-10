{-# LANGUAGE BinaryLiterals #-}

-- bit.hs
-- conversion to binary: 
--   https://stackoverflow.com/a/1959789

import Data.Bits
import Numeric (showIntAtBase)
import Data.Char (intToDigit)

main = do
  putStrLn "bit operations (or,and, xor): "
  
  print [p .|. q | p <- bv, q <- bv]
  print [p .&. q | p <- bv, q <- bv]
  print [p `xor` q | p <- bv, q <- bv]

  let pOrq  = p .|. q
      pAndq = p .&. q 
      pXorq = p `xor` q


  putStrLn $ showIntAtBase 2 intToDigit pOrq  ""
  putStrLn $ showIntAtBase 2 intToDigit pAndq ""
  putStrLn $ showIntAtBase 2 intToDigit pXorq ""
 
--

bv :: [Int]
bv = [0,1]

p,q :: Int
p = 0b0110110110
q = 0b1100011101

