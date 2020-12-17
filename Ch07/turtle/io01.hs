#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

import Turtle

-- main = stdout stdin

{-
stdout 
  :: MonadIO io => 
     Shell Line -> io ()
stdin 
  :: Shell Line

-}

fileName = "tempFile.txt"

main = do
  output fileName ("This" <|> "is" <|> "a test file.")
  stdout (input fileName)
