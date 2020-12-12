-- createDotFile.hs
-- https://stackoverflow.com/a/20860364

import Data.Text.Lazy (unpack)
import Data.GraphViz (graphToDot, nonClusteredParams)
import Data.Graph.Inductive.Example (clr479)
import Data.GraphViz.Printing (renderDot, toDot)

main = putStrLn $ unpack $ renderDot $ toDot $ graphToDot nonClusteredParams clr479
