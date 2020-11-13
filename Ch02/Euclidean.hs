-- Euclidean Algorithm

module Euclidean where

myGcd :: Int -> Int -> Int
myGcd a b = gcd' (abs a) (abs b)
  where
    gcd' :: Int -> Int -> Int
    gcd' x y
      | x == y    = x
      | x > y     = gcd' y x
      | otherwise = gcd' x (y-x)
