#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

import Turtle

-- streams
-- main :: IO ()
main = do
  view $ ls "/tmp"
  view $ ls "/usr"
  
  -- we can comcat. two Shell streams.
  view $ ls "/usr" <|> ls "/tmp"

{-
ls 
  :: Turtle.FilePath -> Shell Turtle.FilePath

view 
  :: (MonadIO io, Show a) => 
     Shell a -> io ()

(<|>) 
  :: Alternative f => 
     f a -> f a -> f a
(<>) 
  :: Semigroup a => 
     a -> a -> a


-}
