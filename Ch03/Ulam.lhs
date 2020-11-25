Ulam.lhs

> module Ulam where
> import Data.List

Supplementary Exercise 8 (page 227)

> hit :: Integral i =>
>        [i] -> i
> hit = head . head . filter (\x -> length x == 1) . group . sort

