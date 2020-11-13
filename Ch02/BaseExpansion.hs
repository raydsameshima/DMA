module BaseExpansion where

-- Base b expansion
baseExp :: Int -> Int -> [Int]
baseExp b n = h b n []
  where
    h :: Int -> Int -> [Int] -> [Int]
    h b q zs
      | q == 0    = zs
      | otherwise = h b q' zs'
      where
        q'  = (q `div` b)
        zs' = (q `mod` b) : zs

list2int :: Int -> [Int] -> Int
list2int b [] = 0
list2int b ys@(x:xs)
  = let l = length ys in
    sum $ map (\(x,y) -> y*b^x) $ zip [l-1,l-2 .. ] ys
