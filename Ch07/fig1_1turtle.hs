#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

-- fig1_1.hs

import Turtle

import Data.GraphViz.Types.Monadic

import qualified Data.GraphViz.Types.Graph as G
import qualified Data.Text.Lazy            as Text

import Data.GraphViz.Types.Generalised (DotGraph)
import Data.GraphViz.Commands.IO       (writeDotFile)
import Data.GraphViz.Printing          (renderDot, toDot)

-- Let us construct a graph: figure 1 of page 439.
network :: DotGraph Text.Text
network = graph' $ do
  let sf = "San Francisco"
      la = "Los Angeles"
      ch = "Chicago"
      ny = "New York"
      ws = "Washington"
      dt = "Detroit"
      dv = "Denver"
  sf <-> dv
  dv <-> la
  la <-> sf
  dv <-> ch
  ch <-> ws
  ws <-> ny
  ny <-> ch
  ny <-> dt
  dt <-> ch

 
-- The shell command I want to reproduce:
-- dot -Tsvg fig1_1.dot > fig1_1_another.svg

{-
λ> :i renderDot
renderDot :: DotCode -> Text
  	-- Defined in ‘Data.GraphViz.Printing’

λ> :i toDot 
class PrintDot a where
  ...
  toDot :: a -> DotCode
  ...
  	-- Defined in ‘Data.GraphViz.Printing’

λ> :i graphToDot nonClusteredParams 
graphToDot ::
  (Ord cl, Data.Graph.Inductive.Graph.Graph gr) =>
  GraphvizParams Data.Graph.Inductive.Graph.Node nl el cl l
  -> gr nl el -> DotGraph Data.Graph.Inductive.Graph.Node
  	-- Defined in ‘Data.GraphViz’
nonClusteredParams :: GraphvizParams n nl el () nl
  	-- Defined in ‘Data.GraphViz’

unpack (renderDot (toDot network)) :: String

-}

main = do
  let fileName = "aaa.dot" 
  writeFile fileName (Text.unpack (renderDot (toDot network)))
 
  stdout $ inshell ("dot -Tsvg aaa.dot > aaa.svg") Turtle.empty
  
  
