-- Algorithm 1 
-- Finding the maximum element in a finite sequence

module MyMax where

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO () 
main = do
  putStrLn "Put a finite [Int]: "
  is <- readInts
{-
  if null is 
     then putStrLn "null list"
     else do
       let m = maximum is
       print m
-}
  print $ myMaximum is


myMaximum :: [Int] -> Maybe Int
myMaximum []     = Nothing
myMaximum (a:as) = Just $ h a as
  where
    h :: Int -> [Int] -> Int
    h x [] = x
    h x (y:ys)
      | x > y     = h x ys
      | otherwise = h y ys
