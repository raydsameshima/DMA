#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

import Turtle

main = sh $ do
  -- create a temporary directory under /tmp
  dir      <- using (mktempdir "/tmp" "turtle")

  -- create a temporary file
  (file,handle) <- using (mktemp dir "turtle")

  -- print the file we've created
  liftIO (print file)
  liftIO (print handle)

  -- let us "fail" the session; even though, the temp items are deleted.
  liftIO (die "u-ga-!")
