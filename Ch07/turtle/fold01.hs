#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

import Turtle
import qualified Control.Foldl as Fold
import Prelude hiding (FilePath)


ex1 :: IO Int
ex1 = fold (ls "/tmp") Fold.length

ex2 :: IO [FilePath]
ex2 = fold (ls "/tmp") Fold.list

ex3 :: IO (Maybe FilePath)
ex3 = fold (ls "/tmp") Fold.head

{-
fold 
  :: MonadIO io => 
     Shell a -> Fold a b -> io b
-}

-- single pass over the stream -- applicative style
ex4 :: IO (Maybe Int, Maybe Int)
ex4 = fold (select [0 .. 9]) ((,) <$> Fold.minimum <*> Fold.maximum)

-- another single pass example
average :: Fold Double Double
average = (/) <$> Fold.sum <*> Fold.genericLength

