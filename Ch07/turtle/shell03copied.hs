#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

import Turtle

main = do
  let cmd = "false"
  x <- shell cmd empty
  case x of
    ExitSuccess   -> return ()
    ExitFailure n -> die $ cmd <> " failed with the exit code: " <> repr n
