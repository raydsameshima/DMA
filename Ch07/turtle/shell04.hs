#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

import Turtle

main = do
  putStrLn "Let me make a silly copy: "
  proc "cp" ["shell03.hs", "shell03copied.hs"] empty
