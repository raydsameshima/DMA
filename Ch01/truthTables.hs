-- ch01 truth tables

main = do
  putStrLn "Negation (TABLE 1): "
  putStrLn $ "For a given p:   " ++ show bv
  putStrLn $ "The negation is: " ++ show [not p | p <- bv ]

  putStrLn "Conjunction and Disjunction (Table 2 and 3): "
  print [p && q | p <- bv, q <- bv]
  print [p || q | p <- bv, q <- bv]

  putStrLn "Exclusive or: "
  print [p `exOr` q | p <- bv, q <- bv]

  putStrLn "Implication: "
  print [p ==> q | p <- bv, q <- bv]

  putStrLn "Biconditional: " 
  print [p <=> q | p <- bv, q <- bv]


  putStrLn "Consider (p || q) and ((p ==> q) ==> q)"
  putStrLn $ "truth table of (p || q):          " ++ show [p || q | p <- bv, q <- bv]
  putStrLn $ "truth table of ((p ==> q) ==> q): " ++ show [((p ==> q) ==> q) | p <- bv, q <- bv]



--

-- Basic Boolean Variables:
bv = [True, False]

-- The exclusive or is the proposition that is True when exactly
-- one of two arguments is True and is False otherwise.
exOr 
  :: Bool -> Bool -> Bool
exOr = (/=) 

-- implication (if p then q)
(==>) :: Bool -> Bool -> Bool
p ==> q
  | p && (not q) = False
  | otherwise    = True

(<=>) :: Bool -> Bool -> Bool
p <=> q = (p ==> q) && (q ==> p)



