{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase #-}

-- fig1_7.hs

import Data.GraphViz.Attributes
import Data.GraphViz.Commands
import Data.GraphViz.Types.Generalised
import Data.GraphViz.Types.Monadic

import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as Text

l = "Linda"
b = "Brian"
d = "Deborah"
f = "Fred"
y = "Yvonne"

influence :: DotGraph Text
influence = digraph' $ do
  b --> l
  b --> y
  d --> l
  d --> b
  d --> f
  f --> b
  y --> f
  y --> b
  
main = runGraphviz influence Png "fig1_7.png"
