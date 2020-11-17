module IntegerDivision where

(|/) :: (Integral n) => n -> n -> Bool
a |/ b = rem b a == 0
