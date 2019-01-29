module RubikScrambles
( generate10
, generate
) where

import System.Random
import Protolude
import Prelude (String, read, (!!))

data Move = F | R | U | L | B | D | F' | R' | U' | L' | B' | D'
  deriving (Show, Read)

generate10 :: IO [Move]
generate10 = generate 10

generate :: Int -> IO [Move]
generate i = do
  sequence $ replicate i fill
  where 
    l :: [Char]
    l = "FRULBD"
    
    fill :: IO Move
    fill = do 
      rand <- randomRIO (0, (length l - 1))
      rev <- randomRIO (True, False)
      pure $ (read $ getValue rand rev :: Move)
        where 
          getValue :: Int -> Bool -> String
          getValue idx r = [l !! idx] ++ if r then "'" else ""
--generatePretty 
