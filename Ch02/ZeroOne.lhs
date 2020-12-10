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

After doing the standard matrix product, we can simply filter it via if_then_else

> ex10 = do
>   let a, b :: Matrix I
>       a = (3><2) 
>           [1,0
>           ,0,1
>           ,1,0]
>       b = (2><3)
>           [1,1,0
>           ,0,1,1]
>   let c = cmap (\x -> if x > 0 then 1 else 0) a <> b
>   print c

> toZeroOne :: I -> I
> toZeroOne x = if x>0 then 1 else 0
>   
> matrixPower :: Numeric t => Matrix t -> Int -> Matrix t
> matrixPower a 0 = (1><1) [0]
> matrixPower a 1 = a
> matrixPower a n = a <> (matrixPower a (n-1))

> ex11 = do
>   let a :: Matrix I
>       a = (3><3)
>           [0,0,1
>           ,1,0,0
>           ,1,1,0]
>   mapM_ (print . cmap toZeroOne . matrixPower a) [1 .. 5]
