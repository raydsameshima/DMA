#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

import Turtle

main = do
  dir  <- pwd
  time <- datefile dir
  print time
