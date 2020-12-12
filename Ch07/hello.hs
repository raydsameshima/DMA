{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase #-}

-- https://qiita.com/lotz/items/4443a3ccb35780fa0c00

import Data.GraphViz.Attributes
import Data.GraphViz.Commands
import Data.GraphViz.Types.Generalised
import Data.GraphViz.Types.Monadic

import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as Text

hello :: DotGraph Text
hello = digraph' $ do
  "Hello"    --> "Graphviz"
  "Graphviz" --> "World"

main = runGraphviz hello Png "hello.png"
