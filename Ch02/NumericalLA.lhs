NumericalLA.lhs

http://dis.um.es/~alberto/hmatrix/hmatrixtut.html

> import Numeric.LinearAlgebra
> import Prelude hiding ((<>))
> import Data.Maybe (isJust)

For given two matrix a and b, let's consider a small (overdetermined) linear equation:
  a <> x = b
for unknown x:

> a, b :: Matrix R
> a = (4><3)
>   [ 1, 2, 3
>   , 4, 0, 5
>   , 7, 7, 2
>   , 3, 3, 1]
> 
> b = (4><2)
>   [ 10, 1
>   , 20, 2
>   , 30, 3
>   , 15, 1]
>
> x,y :: Matrix R
> x = linearSolveLS a b -- Least Square solution
> y = a <> x - b
>
> residual :: R
> residual = norm_Frob y
>
> ex1 = do
>   putStrLn "The least-square solution is: "
>   disp 3 x
>   putStrLn "The Frobenius norm of the difference between (a<>x) and b is: "
>   print residual
>   putStrLn "Let us compare b: " 
>   disp 3 b 
>   putStrLn "and (a<>x): "
>   disp 3 (a <> x)
>
> ex2 = do
>   let a,b :: Matrix R
>       a = (2><2) [1,2,3,4]
>       b = (2><1) [5,6]
>   putStrLn "For a given matrix a: "
>   disp 3 a
>   putStrLn "and a vector b: "
>   disp 3 b
>   putStrLn "The solution for (a <> x)=b is: "
>   print $ linearSolve a b
>   putStrLn "If we replace a by: " 
>   let a' = (2><2) [1,2,3,6]
>   putStrLn "then no solution: "
>   print $ linearSolve a' b
>
> ex3 = do
>   putStrLn "Let us randomly take a (100><100) matrix:"
>   a <- randn 100 100
>   dispShort 5 5 2 a
>   putStrLn "and a vector b:"
>   b <- randn 100 5
>   dispShort 5 5 2 b
>
>   let x = linearSolve a b
>
>   if isJust x 
>     then do
>       let Just y = x
>           z = (a <> y - b)
>       putStrLn "The solution is:"
>       dispShort 5 5 2 y
>       putStrLn "The difference (a<>x) and b is:"
>       dispShort 5 5 15 z
>     else 
>       putStrLn "The random matrix is accidentally singular!"




