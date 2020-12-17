#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

import Turtle

main :: IO ()
main = do
  dir  <- pwd 
  time <- datefile dir 
  print time -- echo $ repr time
  -- echo time
  

{-
datefile 
  :: MonadIO io => 
     Turtle.FilePath -> io UTCTime

hence time :: UTCTime
It's a Show instance, so print is a suitable choice.

echo 
  :: MonadIO io => 
     Line -> io ()
print 
  :: Show a =>  
     a -> IO ()

Note that a Line value is a piece of text witout newlines.

print === echo . repr 
-}

