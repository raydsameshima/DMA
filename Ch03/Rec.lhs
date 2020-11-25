Rec.lhs

> module Rec where

Example 1 of 3.3 (page 203)

> fNaive :: Integer -> Integer
> fNaive 0 = 3
> fNaive n = 2*(fNaive (n-1)) + 3

> fRec, fFold' :: [a] -> Integer
> fRec []     = 3
> fRec (_:ns) = 2*(fRec ns) + 3

> fFold' = foldr f' 3
>   where
>     f' :: a -> Integer -> Integer
>     f' _ n = 2*n + 3
>
> fFold :: Integer -> Integer
> fFold n = fFold' [1..n]

> fAcc :: Integer -> Integer
> fAcc = helper 3
>   where
>     helper :: Integer -> Integer -> Integer
>     helper acc 0 = acc
>     helper acc n = helper (2*acc + 3) (n-1)

> ack :: (Integral n) =>
>        n -> n -> n
> ack m n
>   | m == 0          = 2*n
>   | m > 0 && n == 0 = 0
>   | m > 0 && n == 1 = 2
>   | otherwise       = ack (m-1) (ack m (n-1))
