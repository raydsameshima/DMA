#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

import Turtle

main = sh $ do
  dir      <- using (mktempdir "/tmp" "turtle")
  (file,_) <- using (mktemp dir "turtle")
  liftIO (print file)
  output file (inshell "ls" empty)
  stdout . input $ file

