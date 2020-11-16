module Addition where

import BaseExpansion (base2, list2)

import Test.QuickCheck

base2add' :: [Int] -> [Int] -> [Int]
base2add' as bs 
  | la > lb   = h as bs' 0 []
  | otherwise = h bs as' 0 []
  where
    la = length as
    lb = length bs 
    bs' = bs ++ [0| _<-[1 .. (la-lb)]]
    as' = as ++ [0| _<-[1 .. (lb-la)]]

    h []     []     c cs 
      | c == 0 = cs 
      | c == 1 = cs ++ [c]
    h (a:as) (b:bs) c cs = h as bs k (cs ++ [s])
      where
        k = (a + b + c) `div` 2 -- kuriagari
        s = a + b + c - 2*k

base2add as bs = reverse $ base2add' (reverse as) (reverse bs)
  

-- https://stackoverflow.com/a/52234216
prop_base2 :: Gen Bool
prop_base2 = do
  x <- choose (0, 10000) :: Gen Int
  y <- choose (0, 10000) :: Gen Int
  return $ (x+y) == list2 ( (base2 x) `base2add` (base2 y))

{-
λ> quickCheck prop_base2 
+++ OK, passed 100 tests.
-}
