#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

import Turtle

main :: IO ()
main = sh $ do
  -- create a temporary directory under /tmp
  dir      <- using (mktempdir "/tmp" "turtle")

  -- create a temporary file
  -- instead of mktemp, mktempfile simply gives a way to write/read the tmp-file before it'll be gone
  filePath <- using (mktempfile dir "turtle")
 
  echo "The tmp file is here:"
  liftIO (print filePath)

  echo "Now, print the results of ls:"
  output filePath (inshell "ls" empty)

  echo "And show the contents of the tmp file:"
  stdout (input filePath)

  echo "There still is:"
  liftIO (print filePath)

  -- let us "fail" the session; even though, the temp items are deleted.
  liftIO (die "u-ga-!")
