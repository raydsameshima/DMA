Ulam.lhs

> module Ulam where
> import Data.List 

Supplementary Exercise 8 (page 227)

With initial conditions

ulam 1 = 1
ulam 2 = 2

the next Ulam number is defined the smallest number that is uniquely written as the sum of 
two different previous Ulam numbers.

Ulam numbers (https://oeis.org/A002858)

> ulam 
>   :: Integral i =>
>      Int -> i
> ulam 1 = 1
> ulam 2 = 2
> ulam n
>   | n > 2 = ulams !! (n-1)
>
> ulams
>   :: Integral n =>
>      [n]
> ulams = 1:2:(nexts [2,1])
> nexts us = u: (nexts (u:us))
>   where
>     n = length us
>     [u] = head . filter isSingleton . group . sort  $ 
>             [v | i <- [0 .. n-2], j <- [i+1 .. n-1] 
>                , let s = us !! i
>                , let t = us !! j
>                , let v = s+t
>                , v > head us
>                ]
>
> isSingleton :: [a] -> Bool
> isSingleton as
>   | length as == 1 = True
>   | otherwise      = False
>
>
 


