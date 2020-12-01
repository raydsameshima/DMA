Ulam.lhs

> module Ulam where
> import Data.List 
> -- import qualified Data.Vector.Unboxed as V

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
> ulam n
>   | n > 0 = ulams !! (n-1)
> 
> ulams
>   :: Integral n =>
>      [n]
> ulams = 1:2:(nexts [2,1])
> nexts us = u: (nexts (u:us))
>   where
>     f = head . filter isSingleton . group . sort
>     [u] = f candidates 
>     candidates 
>       = [v | w1 <- tail us
>            , w2 <- takeWhile (> w1) us
>            , let v = w1 + w2
>            , v > head us
>            ]
> 
> isSingleton :: [a] -> Bool
> isSingleton as
>   | length as == 1 = True
>   | otherwise      = False

