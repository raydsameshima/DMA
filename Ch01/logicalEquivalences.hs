bv = [True, False]

-- implication (if p then q)
(==>) :: Bool -> Bool -> Bool
p ==> q
  | p && (not q) = False
  | otherwise    = True


main = do
  putStrLn "Example 2: For p and q of propositions, consider (not (p or q)) and ((not p) and (not q)): "
  print [(p,q) | p <- bv, q <- bv]

  let a = [ not (p || q) | p <- bv, q <- bv]
      b = [ (not p) && (not q) | p <- bv, q <- bv]

  print a
  print b

  putStrLn "As a finite list of Boolean values, are they logically equivalent?"
  print (a == b)

  putStrLn "Example 3: Similarly, consider ((not p) or q) and (p ==> q):"
  let c = [ not p || q | p <- bv, q <- bv]
      d = [ p ==> q | p <- bv, q <- bv]

  print c
  print d

  print (c == d)

  putStrLn "Example 4:"
  print [ p || (q && r) | p <- bv, q <- bv, r <- bv]
  print [ (p || q) && (p || r) | p <- bv, q <- bv, r <- bv]

  putStrLn "Example 5:"
  print [ not (p || ((not p ) && q)) | p <- bv, q <- bv]
  print [ (not p) && (not q) | p <- bv, q <- bv]
 
  putStrLn "Example 6:"
  print [ (p && q) ==> (p || q) | p <- bv, q <- bv]
 

