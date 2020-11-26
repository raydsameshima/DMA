bills.lhs

> import Data.List

> data Bills 
>   = Bills { hundreds :: Int 
>           , fifties  :: Int         
>           , twenties :: Int
>           , tens     :: Int
>           , fives    :: Int
>           , twos     :: Int
>           , ones     :: Int
>           } deriving (Show, Eq)

> bills :: Int -> [Bills]
> bills x 
>   = [Bills n100 n50 n20 n10 n5 n2 n1 
>     | n100 <- [0 .. x]
>     , n50  <- [0 .. x-n100]
>     , n20  <- [0 .. x-n100-n50]
>     , n10  <- [0 .. x-n100-n50-n20]
>     , n5   <- [0 .. x-n100-n50-n20-n10]
>     , n2   <- [0 .. x-n100-n50-n20-n10-n5]
>     , n1   <- [0 .. x-n100-n50-n20-n10-n5-n2]
>     , sum [n100, n50, n20, n10, n5, n2, n1] == x
>     ]

> example4 = do
>   let b5 = bills 5
>   putStrLn $ "The number of choices are: " ++ show (length b5)
>   putStrLn $ "The number of ammounts: " ++ show (length $ group $ map amount b5)   

> amount :: Bills -> Int
> amount (Bills n100 n50 n20 n10 n5 n2 n1)
>   = sum $ zipWith (*) [n100, n50, n20, n10, n5, n2, n1]
>                       [100,  50,  20,  10,  5,  2,  1 ]

