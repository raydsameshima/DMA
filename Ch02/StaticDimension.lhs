StaticDimension.lhs

http://dis.um.es/~alberto/hmatrix/static.html

> {-# LANGUAGE DataKinds #-}
>
> import GHC.TypeLits
> import Numeric.LinearAlgebra.Static
> import qualified Numeric.LinearAlgebra as LA

> dataTypes = do
>   let a = row (vec4 1 2 3 4)
>           ===
>           row (2 & 0 & 7 & 1)
>       u = vec4 10 20 30 40
>       v = vec2 5 0 & 0 & 3 & 7
>
>   putStrLn "The matrix a is: " 
>   disp 3 a
>   disp 3 u
>   disp 3 v
>
>   let y = create (LA.vector [1..10]) :: Maybe (R 5)
>   print y -- Maybe t
>   let z = create (LA.matrix 2 [1..4]) :: Maybe (L 2 2)
>   print z -- Maybe t
>   
>   disp 5 $ diag u
>   
