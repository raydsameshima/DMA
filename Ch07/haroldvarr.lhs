> {-# LANGUAGE OverloadedStrings #-}

haroldvarr.lhs

http://haroldcarr.com/posts/2014-02-28-using-graphviz-via-haskell.html

> -- module Main where
>
> import Data.Graph.Inductive -- fgl
> import Data.GraphViz
> import Data.GraphViz.Attributes.Complete
> import Data.GraphViz.Types.Monadic
> import Data.Word
> -- import           WriteRunDot -- what's this?
>
> import qualified Data.GraphViz.Types.Generalised as G
> import qualified Data.Text.Lazy                  as L

creating dot graphs from Data.Graph.Inductive (fgl) input

> ex1 :: Gr L.Text L.Text
> ex1 = mkGraph 
>   [ (1, "one"), (3, "three") ] 
>   [ (1,3, "edge label") ]
>
> -- ex1Params = GraphvizParams n L.Text L.Text () L.Text
> ex1Params = nonClusteredParams
>   { globalAttributes = ga
>   , fmtNode          = fn
>   , fmtEdge          = fe
>   }
>   where
>     fn (_,l)   = [textLabel l]
>     fe (_,_,l) = [textLabel l]
>     ga = [ GraphAttrs [ RankDir   FromLeft
>                       , BgColor   [toWColor White]
>                       ]
>          , NodeAttrs  [ shape     BoxShape
>                       , FillColor (myColorCL 2)
>                       , style     filled
>                       ]
>          ]
> myColorCL n
>   | n == 2 = c $ (RGB 175 177 112)
>   where c rgb = toColorList [rgb]
