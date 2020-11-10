
f = floor
c = ceiling


main = do
  putStrLn "Example 21: "
  print $ [ func x | x <- [0.5, -0.5, 3.1, 7], func <- [f,c]] 
