ex6_1_3.lhs

> data GPA 
>   = GPA {name :: String, idnum :: Int, major :: Major, gpa :: Double }
>     deriving (Eq, Show)

>
> data Major = CS | Phys | Math | Psyc deriving (Eq, Show)
>  
>
> ack = GPA "Ackerman" 231455 CS 3.88 
> ada = GPA "Adams" 888323 Phys 3.45
> cho = GPA "Chow" 102147 CS 3.79
> goo = GPA "Goodfriend" 453876 Math 3.45
> rao = GPA "Rao" 678543 Math 3.90
> ste = GPA "Stevens" 786576 Psyc 2.99
>
> table = [ack, ada, cho, goo, rao, ste]
>
> main = do
>   putStrLn "(1,4) projection of the table is: "
>   print $ map (\x -> (name x, gpa x)) table

