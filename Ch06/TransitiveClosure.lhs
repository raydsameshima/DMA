TransitiveClosure.lhs

> module TransitiveClosure where
>
> import Data.Bits
> import Numeric.LinearAlgebra
> import Data.List (foldl')

> m :: Matrix I
> m = (3><3) 
>     [1,0,1
>     ,0,1,0
>     ,1,1,0]

> transitiveClosure :: Matrix I -> Maybe (Matrix I)
> transitiveClosure m
>   | rm /= lm  = Nothing
>   | otherwise = Just $ cmap toZeroOne . matrixSum . map (matrixPower m) $ [1 .. rm]
>   where 
>     rm = rows m
>     lm = cols m
>    
> toZeroOne :: I -> I
> toZeroOne i
>   | i == 0    = 0
>   | otherwise = 1
>
> matrixSum :: [Matrix I] -> Matrix I
> matrixSum = foldl' (+) 0
>
> matrixPower :: Matrix I -> Int -> Matrix I
> matrixPower a 1 = a
> matrixPower a n = a <> (matrixPower a (n-1))

> ex7 = do
>   print $ transitiveClosure m
