ZeroOne.lhs

> import Data.Bits

> ex9 = do
>   let a,b :: [Int]
>       a = 
>         [1,0,1
>         ,0,1,0]
>       b = 
>         [0,1,0
>         ,1,1,0]
>
>   let c = zipWith (.|.) a b 
>   print c
>   print $ zipWith (.&.) a b


