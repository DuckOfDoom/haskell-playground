module Main where

import Protolude
-- import GlossExample (draw)
import qualified Server (main)

main :: IO ()
main = Server.main
