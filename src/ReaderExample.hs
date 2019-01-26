module ReaderExample
( run )
where

import Control.Monad.Reader
--import Control.Lens

data Config = Config 
  { configValue1 :: Int
  , configValue2 :: String
  } deriving Show
  
--makeLenses ''Config
  
defaultConfig :: Config
defaultConfig = Config
 { configValue1 = 120
 , configValue2 = "Hey"
 } 

run :: IO () 
run = do
  putStrLn $ (runReader showConfig) defaultConfig 
--  putStrLn str
  
showConfig :: Reader Config String 
showConfig = do
  conf <- ask
  return $ show conf

