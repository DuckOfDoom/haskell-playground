module Parsing where

import Protolude

import Data.Attoparsec.Text
import qualified Data.Char as Char
import qualified Data.Text as T

testParse :: Text -> IO ()
testParse v = do
  print $ parseOnly parseHandler v

data Handler = Quiz Text | Mode Text | Unknown
 deriving (Show)

modes = "derp"

parseHandler :: Parser Handler
parseHandler = parseQuiz <|> parseMode

parseQuiz :: Parser Handler
parseQuiz = do
  string "/q"
  space
  val <- many1 (letter <|> space) 
  return $ Quiz (T.pack val)

parseMode :: Parser Handler
parseMode = do 
  string "/mode"
  space 
  val <- do
    v1 <- satisfy (\c -> inClass ['A'..'G'] $ Char.toUpper c)
    v2 <- (char '#' <|> char 'b')
    pure [v1, v2]
    -- space <*>

  pure $ Mode (T.pack val)