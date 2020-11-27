catalan.lhs

> c n = cs !! n
>
> cs 
>   :: Integral n =>
>       [n]
> cs = 1 : catalize [1] cs
> --  where
> catalize 
>   :: Integral n =>
>      [n] -> [n] -> [n]
> catalize bs (d:ds) = o: catalize (o:bs) ds
>   where
>     o = sum $ zipWith (*) bs (reverse bs)

