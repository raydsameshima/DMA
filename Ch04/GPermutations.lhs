GPermutations.lhs

> import Data.List
>
> nextPerm :: Int -> Int
> nextPerm n = let s = show n in
>   read $ head $ dropWhile (<= s) $ sort $ permutations s
> 
> example2 = do
>   let n = 362541
>   putStrLn $ "the next largest permutation in lex order after: " ++ show n ++ " is: " ++ show (nextPerm n)
>   

