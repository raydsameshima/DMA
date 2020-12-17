#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

import Prelude hiding (FilePath)
import Turtle

targetDir :: FilePath
targetDir = "test"

main = do
  -- creating a target directory, generate an empty testfile
  mkdir targetDir 
  cd targetDir
  touch "testfile"

  -- returning to a parent directory, archive the directory we've created
  cd "../"
  shell                        --
    "tar czf test.tar.gz test" -- :: Text       (command line)
    empty                      -- :: Shell Line (standard input)
