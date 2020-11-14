module Addition where

base2add' :: [Int] -> [Int] -> [Int]
base2add' as bs = h as bs 0 []
-- assuming they are the same length and ascending order (already swapped)
  where
    h []     _      c cs = cs ++ [c]
    h (a:as) (b:bs) c cs = h as bs c' (s:cs)
      where
        c' = (a + b + c) `div` 2
        s = a + b + c - 2*c'
      
base2add as bs = reverse $ base2add' (reverse as) (reverse bs)
  
  

