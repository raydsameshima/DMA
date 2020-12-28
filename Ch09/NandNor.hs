-- 9.2 
-- functional completeness nand and nor

nand, nor :: Bool -> Bool -> Bool
x `nand` y 
  | x && y    = False
  | otherwise = True

x `nor` y
  | (not x) && (not y) = True
  | otherwise          = False

main = do
  putStrLn "not x:"
  print $ map nand' bv == map not bv
  print $ map nor' bv == map not bv

  putStrLn "x && y:"
  print $ [(x `nand` y) `nand` (x `nand` y)| x <- bv, y <- bv] == [x && y | x <- bv, y <- bv] 
  print $ [(x `nor` x) `nor` (y `nor` y)| x <- bv, y <- bv] == [x && y | x <- bv, y <- bv] 


nand' x = x `nand` x
nor' x = x `nor` x

bv = [True, False]
