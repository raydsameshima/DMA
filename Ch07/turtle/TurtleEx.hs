#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

-- TurtleEx.lhs

import Turtle
import qualified Control.Foldl as Fold

-- change dir to /tmp and show the current (i.e., /tmp) directory
ex00 = do
  cd "/tmp" :: IO () -- otherwise ghc complains
  pwd

-- to counts the files under /usr
ex01, ex01' :: IO Int
ex01  = fold (ls "/usr") Fold.length
ex01' = (flip fold) Fold.length (ls "/usr")

{-
fold 
  :: MonadIO io => 
     Shell a -> Fold a b -> io b

Fold.length 
  :: Fold a Int
Data.List.length 
  :: Foldable t => 
     t a -> Int

I.e., the Turtle.fold (it seems the first and second arguments flipped) is literary fold, 
identifying Fold.length as a function of a -> Int (like Data.List.length).

-}

-- to create files use output; to see the absolute path use realpath
ex02 :: IO Turtle.FilePath
ex02 = do
  output "foo.txt" ("123" <|> "456" <|> "ABC")
  realpath "foo.txt"
  
{-
λ> :! cat foo.txt 
123
456
ABC

output 
  :: MonadIO io => 
     Turtle.FilePath -> Shell Line -> io ()
(<|>) 
  :: Alternative f => 
     f a -> f a -> f a
realpath 
  :: MonadIO io => 
     Turtle.FilePath -> io Turtle.FilePath

With this combination of functions, the connected strings are indeed

("123" <|> "456" <|> "ABC") :: Shell Line

-}

-- if we replace on <|> by a concat <>
ex02' :: IO ()
ex02' = do
  output "foo2.txt" ("123" <> "456" <|> "ABC")
  stdout (input "foo2.txt")

{-
λ> ex02'
123456
ABC

as we've expected.

-}

-- to read the file use stdou 
ex03 :: IO ()
ex03 = do
  putStrLn "if we read foo.txt, we obtain:"
  stdout (input "foo.txt")

{-
stdout 
  :: MonadIO io => 
     Shell Line -> io ()
input 
  :: Turtle.FilePath -> Shell Line

-}

ex04, ex04' :: IO Text
ex04 = do
  dir <- pwd
  return $ format ("I am in the "%fp %" directory") dir

-- hlint suggests the following:
ex04' = format ("I am in the " %fp % " directory") <$> pwd

{-
pwd :: MonadIO io => io Turtle.FilePath

format :: Format Text r -> r

As in the tutorial,
format fp :: FilePath -> Text

the returned value must be IO Text.

-}

-- printf :: MonadIO io => Format (io ()) r -> r
ex05 :: IO ()
ex05 = do
  printf ("Hello, "%s %"!\n") "world"

 
-- grep :: Pattern a -> Shell Line -> Shell Line
-- - print lines that match patterns
-- to find ("123" <|> "ABC") in the file foo.txt
ex06, ex06' :: IO ()
ex06 = do
  stdout (grep ("123" <|> "ABC") (input "foo.txt")) 

ex06' = do
  stdout (grep ("123" <|> "ABC") (input "foo2.txt")) 

-- sed :: Pattern Text -> Shell Line -> Shell Line
-- - stream editor for filtering and transforming text
-- if we find the "digit" pattern (digit matches a digit), 
-- concat ! at the end of each line in foo.txt
ex07 :: IO ()
ex07 = do
  let exclaim = fmap (<> "!") (plus digit)
  stdout (sed exclaim (input "foo.txt"))

{-
plus 
  :: Pattern Char -> Pattern Text
digit  
  :: Pattern Char
input 
  :: Turtle.FilePath -> Shell Line

-}

{-
grep :: Pattern a -> Shell Line -> Shell Line
- print lines that match patterns

sed :: Pattern Text -> Shell Line -> Shell Line
- stream editor for filtering and transforming text

find :: Pattern a -> Turtle.FilePath -> Shell Turtle.FilePath
- search for files in a directory hierarchy

-}

-- to find some pattern in foo.txt
ex08 :: IO ()
ex08 = do
  stdout (grep (has    "2") (input "foo.txt"))
  stdout (grep (prefix "1") (input "foo.txt"))
  stdout (grep (suffix "3") (input "foo.txt"))
  stdout (grep (has    "C") (input "foo.txt"))


