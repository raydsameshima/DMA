{-# LANGUAGE OverloadedStrings #-}

import Turtle

import qualified Data.Graph.Inductive as G

import Data.Text.Lazy (unpack)
import Data.GraphViz (graphToDot, nonClusteredParams)
import Data.Graph.Inductive.Example (clr479)
import Data.GraphViz.Printing (renderDot, toDot)


cyc3 :: G.Gr Char String
cyc3 = G.buildGr
  [([("ca",3)], 1, 'a', [("ab",2)])
  ,([],         2, 'b', [("bc",3)])
  ,([],         3, 'c', [])]

ex1 :: Bool
ex1 = G.hasLoop xx

ex2 :: [(G.Node, [G.Node])]
ex2 = G.dom xx 0

xx :: G.Gr Int ()
xx = G.insEdges edges gr
  where
    gr = G.insNodes nodes G.empty
    edges = [(0,1,()), (0,2,()), (2,1,()), (2,3,())]
    nodes = zip [0 .. ] [2,3,4,1]

main = putStrLn . unpack . renderDot . toDot $ graphToDot nonClusteredParams cyc3
  
