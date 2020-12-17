#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

import Turtle

-- save the outcomes of ls command into a file
main = 
  output "anotherTempFile.txt" (inshell "ls" empty)

