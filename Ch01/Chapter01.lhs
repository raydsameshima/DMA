Chapter01.lhs

> module Chapter01 where
> import Data.List (group)

The Foundations: Logic, Sets, and Functions

Table 1 of negation.

> truthTable 
>   :: (Bool -> Bool) -> [[Bool]]
> truthTable bf = [[p, bf p]|p <- [True, False]]

*Chapter01 Turtle> truthTable not
[[True,False]
,[False,True]]

> tt2
>   :: (Bool -> Bool -> Bool) -> [[Bool]]
> tt2 bf = [[p,q, bf p q] | let bls = [True, False]
>                         , p <- bls, q <- bls ]

*Chapter01 Turtle> tt2 (&&) -- and
[[True,True,True]
,[True,False,False]
,[False,True,False]
,[False,False,False]]
*Chapter01 Turtle> tt2 (||) -- or
[[True,True,True]
,[True,False,True]
,[False,True,True]
,[False,False,False]]

Table 5 of implication.

> implies :: Bool -> Bool -> Bool
> p `implies` q
>   | not p     = True
>   | otherwise = q

*Chapter01 Turtle> tt2 implies 
[[True,True,True]
,[True,False,False]
,[False,True,True]
,[False,False,True]]

Table 6 of biconditional.

> p `bicon` q = (p `implies` q) && (q `implies` p)

*Chapter01 Turtle> tt2 bicon 
[[True,True,True]
,[True,False,False]
,[False,True,False]
,[False,False,True]]

Logical equivalences

*Chapter01 Turtle> tt2 implies
[[True,True,True]
,[True,False,False]
,[False,True,True]
,[False,False,True]]
*Chapter01 Turtle> tt2 (\p q -> not p || q)
[[True,True,True]
,[True,False,False]
,[False,True,True]
,[False,False,True]]

*Chapter01 Turtle> (tt2 implies ) == (tt2 (\p q -> not p || q))
True

Example 5
*Chapter01 Turtle> tt2 (\p q -> not(p || ((not p) && q)))
[[True,True,False]
,[True,False,False]
,[False,True,False]
,[False,False,True]]
*Chapter01 Turtle> tt2 (\p q -> not p && not q)
[[True,True,False]
,[True,False,False]
,[False,True,False]
,[False,False,True]]
*Chapter01 Turtle> tt2 (\p q -> not(p || ((not p) && q))) == tt2 (\p q -> not p && not q)
True

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
>   | n < 5     = 0
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

