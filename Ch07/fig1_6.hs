{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase #-}

-- fig1_6.hs

import Data.GraphViz.Attributes
import Data.GraphViz.Commands
import Data.GraphViz.Types.Generalised
import Data.GraphViz.Types.Monadic

import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as Text

rc = "Raccoon"
hk = "Hawk"
ow = "Owl"
op = "Opossum"
sq = "Squirrel"
cr = "Crow"
sh = "Shrew"
ms = "Mouse"
wp = "Woodpecker"
 
niche :: DotGraph Text
niche = graph' $ do
  rc --> ow
  rc --> hk
  rc --> sq
  hk --> ow
  hk --> cr
  ow --> cr
  op --> sq
  op --> wp
  op --> sh
  sq --> cr
  sq --> wp
  sh --> ms
  sh --> wp
  
main = runGraphviz niche Png "fig1_6.png"
