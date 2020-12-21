#!/usr/bin/env stack
-- stack --resolver lts-10.2 script

{-# LANGUAGE OverloadedStrings #-}

-- fig1_1.hs

import Turtle
import Prelude hiding (FilePath)

import Data.GraphViz.Types.Monadic

import qualified Data.GraphViz.Types.Graph as G
import qualified Data.Text.Lazy            as Text

import Data.GraphViz.Types.Generalised (DotGraph)
import Data.GraphViz.Commands.IO       (writeDotFile)
import Data.GraphViz.Printing          (renderDot, toDot)

-- Let us construct a graph: figure 1 of page 439.
-- network :: DotGraph Text.Text
network :: DotGraph Text
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

main :: IO ()
main = do
  let fileName, dotFileName, svgFileName :: FilePath
      -- the file names for dot and svg file
      fileName    = "bbb"  
      dotFileName = fileName <.> "dot"
      svgFileName = fileName <.> "svg"

  -- write a dot file of the graph 
  output dotFileName (select . textToLines . fromString . Text.unpack . renderDot . toDot $ network)

  let Right fnDot = toText dotFileName
      Right fnSvg = toText svgFileName

  -- calling external (shell command?), draw an svg fi.e
  stdout $ inshell ("dot -Tsvg " <> fnDot <> " > " <> fnSvg) Turtle.empty
    
