module RubikScrambles
( generate10
, generate
) where

import System.Random

data Move = F | R | U | L | B | D | F' | R' | U' | L' | B' | D'
  deriving (Show, Read)

generate10 :: IO [Move]
generate10 = generate 10

generate :: Int -> IO [Move]
generate i = do
  sequence $ replicate i fill
  where 
    list :: [Char]
    list = "FRULBD"
    
    fill :: IO Move
    fill = do 
      rand <- randomRIO (0, (length list - 1))
      reverse <- randomRIO (True, False)
      pure $ (read $ getValue rand reverse :: Move)
        where 
          getValue :: Int -> Bool -> String
          getValue i reverse = [list !! i] ++ if reverse then "'" else ""
--generatePretty 
