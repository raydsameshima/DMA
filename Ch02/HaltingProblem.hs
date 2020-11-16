module HaltingProblem where

-- To reveal the halting problem, let us consider the following Collatz problem:
collatz :: Integer -> [Integer]
collatz n
  | n < 1  = error "argument must be positive"
  | n == 1 = [1]
  | even n = n: collatz (n `div` 2)
  | odd n  = n: collatz (3*n+1)

{-
So far, there is no proof whether the Collatz sequence terminates in a finite step or not.
Suppose that a haskell function

> halts

can be defined, then define the following (ill-)codes:

> funny x
>   | halts x x = undefined -- diverges
>   | otherwise = True      -- converges

and try to execute funny funny.

If funny funny does NOT halt, then by def. we are in the first case of the guard.
This is the case where the argument of the first funny is the second funny and halts, contradiction!
Similarly if funny funny does halt, then we are in the second case: funny funny does not halt case, contradiction!

-}
