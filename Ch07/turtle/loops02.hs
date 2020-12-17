#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

import Turtle

go :: Shell a
go = do
  x <- select [1,2]
  y <- select [3,4]
  liftIO $ print (x,y)
  empty

outer :: Shell ()
outer = do
  go
  liftIO $ echo "This step won't show up"

{-
sh :: MonadIO io => Shell a -> io ()

λ> sh go
(1,3)
(1,4)
(2,3)
(2,4)

As we've seen Shell behaves like a list comprehension, an Shell stream that produces 0 elements will
  short-circuit
and prevent subsequent commands from being run:

λ> sh outer
(1,3)
(1,4)
(2,3)
(2,4)

If we need to run a Shell stream just for its side effects, we can simply wrap the Shell with sh:

-}

outer2 :: Shell ()
outer2 = do
  sh go
  liftIO $ echo "This step will show up"

{-
λ> sh outer2
(1,3)
(1,4)
(2,3)
(2,4)
This step will show up

-}

lookaround = do
  file <- ls "/tmp"
  liftIO $ print file

{-
λ> sh lookaround 
FilePath "/tmp/.ICE-unix"
..

λ> view lookaround 
FilePath "/tmp/.ICE-unix"
()
..
-}

{-
We can filter streams with mfilter:
mfilter 
  :: MonadPlus m => 
     (a -> Bool) -> m a -> m a

λ> view $ select [0 ..9]
0
1
2
3
4
5
6
7
8
9

λ> view $ mfilter even $ select [0..9]
0
2
4
6
8
-}
