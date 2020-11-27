Ulam.lhs

> module Ulam where
> import Data.List 

Supplementary Exercise 8 (page 227)
Ulam numbers (https://oeis.org/A002858)

> ulam 1 = 1
> ulam 2 = 2
> ulam n
>   | n > 2 = ulams !! (n-1)
>
> ulams = 1:2: undefined -- (nexts ulams)
> 
