module Multiplication where

import Addition (base2add')
import BaseExpansion (base2, list2)

import Test.QuickCheck

multi' :: [Int] -> [Int] -> [Int]
multi' as bs 
  | length as < length bs = mlt' as bs []
  | otherwise             = mlt' bs as []
-- assuming as and bs are the same length list, and swapped the order
  where
    mlt' []     _  cs = cs
    mlt' (x:xs) ys cs 
      | x == 0 = mlt' xs (0:ys) cs
      | x == 1 = mlt' xs (0:ys) (base2add' cs ys)

multi as bs = dropWhile (==0) $ reverse $ (reverse as) `multi'` (reverse bs)

-- https://stackoverflow.com/a/52234216
prop_multi2 :: Gen Bool
prop_multi2 = do
  x <- choose (0, 300) :: Gen Int
  y <- choose (0, 500) :: Gen Int
  return $ (x*y) == list2 ( (base2 x) `multi` (base2 y))

{-
λ> quickCheck prop_multi2 
+++ OK, passed 100 tests.
-}
