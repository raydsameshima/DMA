{-# LANGUAGE OverloadedStrings #-}
-- {-# LANGUAGE LambdaCase #-}

-- fig1_1.hs

import Data.GraphViz.Attributes
import Data.GraphViz.Commands
import Data.GraphViz.Types
import Data.GraphViz.Types.Generalised
import Data.GraphViz.Types.Monadic

import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as Text
import qualified Data.GraphViz.Types.Graph as G

network :: DotGraph Text
network = graph' $ do
  let sf = "San Francisco"
      la = "Los Angeles"
      ch = "Chicago"
      ny = "New York"
      ws = "Washington"
      dt = "Detroit"
      dv = "Denver"
  sf --> dv
  dv --> la
  la --> sf
  dv --> ch
  ch --> ws
  ws --> ny
  ny --> ch
  ny --> dt
  dt --> ch

main = runGraphviz network Png "fig1_1.png"

example = do
  putStrLn "Let me show some example; the network is DotGraph:"
  print network
  putStrLn "Once we use printDotGraph, we can import network in dot format:"
  putStrLn . Text.unpack . printDotGraph $ network
  putStrLn "Let me examine few functions in Data.GraphViz.Types:"
  print $ getID network
  print $ graphIsDirected network
  putStrLn "map function is also there:"
  let newNetwork = mapDotGraph ("US-" `Text.append` ) network
  runGraphviz newNetwork Png "fig1_1new.png"

  putStrLn "Once I append US-, the new graph becomes:"
  putStrLn . Text.unpack . printDotGraph $ newNetwork
 
  print $ graphNodes network
  print $ graphEdges newNetwork

  putStrLn "Next, let me examine Data.GraphViz.Types.Graph."
  putStrLn "The nodes adjacent to New York are:"
  let adjList = G.adjacentTo (G.fromDotRepr network) "New York"
  print adjList
  putStrLn $ "The number of cities are: " ++ show (length adjList)

  putStrLn "To obtain the list of nodes:"
  let listOfNodes = map nodeID $ graphNodes network
  print listOfNodes

  let degreeNetwork = mapDotGraph (length . G.adjacentTo (G.fromDotRepr network)) network
  
  putStrLn . Text.unpack . printDotGraph $ degreeNetwork
