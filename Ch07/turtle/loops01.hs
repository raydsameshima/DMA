#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

import Turtle

-- loops
go :: Shell ()
go = do
  x <- select [1,2]
  y <- select [3,4]
  liftIO $ print (x,y)

-- sh :: Shell a -> IO ()
main = sh go

{-
select 
  :: Foldable f =>
     f a -> Shell a
-}

