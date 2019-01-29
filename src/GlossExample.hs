module GlossExample 
where

import Protolude
import Graphics.Gloss

draw :: IO ()
draw = display (InWindow "Derp" (200, 200) (10, 10)) black (Circle 80)