LinearAlgebra.lhs

> module LinearAlgebra where
> import Prelude hiding ((<>))
> import Numeric.LinearAlgebra

> ex1 = do
>   let a,b :: Matrix R
>       a = (2><2) [1,2
>                  ,3,4]
>       b = (2><1) [5
>                  ,6]
>   putStrLn "The possible solution to a <> x = b is: "
>   print $ linearSolve a b
>   putStrLn "You may use the general solver <\\ >: "
>   print $ a <\> b
>
> ex2 = do
>   let a,b :: Matrix R
>       a = (2><2) [1,2
>                  ,3,6] -- singular matrix
>       b = (2><1) [5
>                  ,6]
>   putStrLn $ "For a: " ++ show a ++ " and b: " ++ show b ++ " the possivle solution to a <> x = b is: "
>   print $ linearSolve a b
>   putStrLn "You may use the general solver <\\ >: "
>   let y = a <\> b
>   print $ y
>   print $ b - a <> y

