TreeDiagram.lhs

> module TreeDiagram where
> import Data.List

> plant :: [[Int]] -> [[Int]]
> plant [[]] = [[0],[1]]
> plant [os] 
>   | head os == 1 = [0:os]
>   | otherwise    = [0:os, 1:os]
> plant oss@(o:os)
>   | null oss = [[]]
>   | head o == 1 = (0:o): plant os
>   | head o == 0 = (0:o):(1:o) : plant os

> nonConsectiveOnes :: Int -> [[Int]]
> nonConsectiveOnes n = app n plant [[]]
>   where
>     app 0 f x = x
>     app n f x = app (n-1) f (f x)
>
> example17 = do
>   putStrLn "the number of bit string of length four without consective 1s: "
>   let ls = nonConsectiveOnes 4
>   print $ length ls 
>   putStrLn $ "the list is: " ++ show ls
   



