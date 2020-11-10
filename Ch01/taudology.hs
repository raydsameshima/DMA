-- tautology.hs

bv = [True, False]

main = do
  print bv
  print $ map not bv

  putStrLn "The following True-const. proposition is tautology:"
  print [p || not p | p <- bv]

  putStrLn "The following False-const. proposition is contradiction:"
  print [p && not p | p <- bv]

