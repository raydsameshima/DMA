ex5_6_1.lhs

example 1 of section 5.6

> sol 
>   = [(x1,x2,x3) 
>       | x1 <- [0..3]
>       , x2 <- [0..4]
>       , x3 <- [0..6]
>       , x1+x2+x3 == 11
>       ]

> main = do 
>   putStrLn $ "The solutions are: " ++ show sol
>   putStrLn $ "The number of sol is: " ++ show (length sol)
