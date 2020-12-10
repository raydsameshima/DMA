ZeroOne.lhs

> import Data.Bits
> import Numeric.LinearAlgebra

My first attmept: using Data.Bits and perform the bit-wise operation.

> ex9Bits = do
>   let a,b :: [Int]
>       a = 
>         [1,0,1
>         ,0,1,0]
>       b = 
>         [0,1,0
>         ,1,1,0]
>
>   let c = zipWith (.|.) a b  -- bitwise or
>   print c
>   print $ zipWith (.&.) a b  -- bitwise and

Second attempt is using the buildin (Hadamard) product in Numeric.LinearAlgebra.

> ex9Matrix = do
>   let a,b :: Matrix I
>       a = (2><3) 
>         [1,0,1
>         ,0,1,0]
>       b = (2><3)
>         [0,1,0
>         ,1,1,0]
>   print $ a * b -- Hadamard product
>   print $ a + b -- of course 2 means 1 in boolean algebra

Let me combine them together; list level bitwise operation and convert them into matrix.

> ex9 = do
>   let a =       -- type annotation [Int] does not work!
>         [1,0,1
>         ,0,1,0]
>       b = 
>         [0,1,0
>         ,1,1,0]
>       c = zipWith (.|.) a b
>       d = zipWith (.&.) a b
> 
>       c', d' :: Matrix I
>       c' = (2><3) c
>       d' = (2><3) d
>   print c'
>   print d'
