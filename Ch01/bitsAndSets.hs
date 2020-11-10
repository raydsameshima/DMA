{-# LANGUAGE BinaryLiterals #-}

-- bits and sets

import Data.IntSet (IntSet)
import qualified Data.IntSet as IntSet

import Data.Bits
import Numeric (showIntAtBase)
import Data.Char (intToDigit)


x = IntSet.fromList [1 .. 5]
y = IntSet.fromList [1, 3 .. 9]

main = do
  putStrLn "Example 18:"
  print x
  print y
  print $ x `IntSet.union` y
  print $ x `IntSet.intersection` y

  let p = (0b1111100000 :: Int)
      q = (0b1010101010 :: Int)
   
  putStrLn $ int2bin (p .|. q)
  putStrLn $ int2bin (p .&. q)


-- https://stackoverflow.com/a/1959789
-- Bitwise operations are basically integer arithmetic, so the outcomes are integer values.
-- To convert Int into binary form, we use showIntAtBase:
int2bin 
  :: Int -> String
int2bin x = showIntAtBase 2 intToDigit x ""

