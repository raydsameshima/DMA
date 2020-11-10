{-# LANGUAGE BinaryLiterals #-}

-- bit.hs

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


  putStrLn $ int2bin pOrq  
  putStrLn $ int2bin pAndq 
  putStrLn $ int2bin pXorq 
 
--

bv :: [Int]
bv = [0,1]

p,q :: Int
p = 0b0110110110
q = 0b1100011101

-- https://stackoverflow.com/a/1959789
-- Bitwise operations are basically integer arithmetic, so the outcomes are integer values.
-- To convert Int into binary form, we use showIntAtBase:
int2bin 
  :: Int -> String
int2bin x = showIntAtBase 2 intToDigit x ""

