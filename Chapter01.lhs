Chapter01.lhs

> module Chapter01 where
> import Data.List (group)

Computations and Explorations

1. What is the largest value of n for which n! (n factorial) has fewer than 
100 decimal digits and fewer than 1000 decimal digits?

fact returns factorial.

> fact 
>   :: Integer -> Integer
> fact n = product [1 .. n]

findKeta counts the digits of n factorial.

> findKeta 
>   :: Integer -> Int
> findKeta = length . show . fact

findN k = the smallest integer n s.t., (findKeta n) <= k

> findSmallestN
>   :: Int -> Integer
> findSmallestN = h 1 
>   where
>     h a n
>       | findKeta a < n = h (a+1) n
>       | otherwise      = a

*Chapter01> findSmallestN 1000
450

*Chapter01> fact 450
 ...

*Chapter01> findKeta 450
1001

*Chapter01> findKeta 449
998

2. How many zerow are there at the end of the decimal representation of n! 
for each of the first 25 positive integers n?

> countZeros
>   :: Integer -> Int
> countZeros n
>   | n < 5 = 0
>   | otherwise = length . last . group . show . fact $ n

*Chapter01> countZeros 10
2

*Chapter01> fact 10
3628800

*Chapter01> map countZeros [1 .. 25]
[0,0,0,0,1,1,1,1,1,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4,6]

This sequence has a name "Number of trailing zeros in n!", see 
  http://oeis.org/A027868

> a027868 n = sum $ takeWhile (> 0) $ map (n `div`) $ tail a000351_list
> a000351_list = iterate (* 5) 1

