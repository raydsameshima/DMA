#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

import Turtle

-- string formatting with printf-style
main = do
  let cmd = "false"
  x <- shell cmd empty
  case x of
    ExitSuccess   -> return ()
    ExitFailure n -> die (format (s % " failed with the exit code: " % d) cmd n)

{-
die 
  :: MonadIO io => 
     Text -> io a

-}
