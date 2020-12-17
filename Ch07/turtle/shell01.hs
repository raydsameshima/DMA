#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

import Turtle

main = do
  cd "/tmp"
  pwd

{-
shell 
  :: MonadIO io => 
     Text -> Shell Line -> io ExitCode
-}

