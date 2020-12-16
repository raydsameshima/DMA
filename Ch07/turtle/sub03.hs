#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

import Turtle

datePwd :: IO UTCTime
datePwd = do
  dir    <- pwd
  result <- datefile dir
  return result

main :: IO ()
main = do
  time <- datePwd
  print time

{-
pwd 
  :: MonadIO io => 
     io Turtle.FilePath
datefile 
  :: MonadIO io => 
     Turtle.FilePath -> io UTCTime
print 
  :: Show a => 
     a -> IO ()
-}
