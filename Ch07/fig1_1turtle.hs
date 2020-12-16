#!/usr/bin/env stack

{-# LANGUAGE OverloadedStrings #-}

-- fig1_1.hs

import Turtle

import Data.GraphViz.Commands
import Data.GraphViz.Types
import Data.GraphViz.Types.Generalised
import Data.GraphViz.Types.Monadic

import qualified Data.GraphViz.Types.Graph as G

import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as Text

import Data.GraphViz.Commands.IO (writeDotFile)

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

-- to print an image file
generateFigurePng = runGraphviz network Png "fig1_1.png"
generateFigureSvg = runGraphviz network Svg "fig1_1.svg"

generateDotFile = do
  let dotFileName = "fig1_1.dot"

  writeDotFile dotFileName network
  
-- dot -Tsvg fig1_1.dot > fig1_1_another.svg

{-
  creating a temp dot-file in the current directory,
  write the dot file
  then redirecting the dot-file with dot command,
  create an svg file
-}
generateSvg = do
  dir <- pwd
  (file,_) <- using (mktemp dir "dot") -- file :: FilePath
  liftIO $ print file

  writeDotFile (encodeString file) network

  shell ("dot -Tsvg " `append` file `append` " > test.svg") empty
  


-- using turtle, our goal is
--   to generate a (aux) dot file
--   using pipe (?) draw a figure in an appropriate format (svg?)

