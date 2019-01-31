module Server where

import Protolude

import Network.Wai (responseLBS, Application)
import qualified Network.Wai.Handler.Warp as Warp (run)
import Network.HTTP.Types (status200)
import Network.HTTP.Types.Header (hContentType)

-- Minimal web server
main :: IO ()
main = do
  let port = 3000
  putStrLn $ "Listening on port " ++ show port
  Warp.run port app

app :: Application
app request f = do
  print $ request 
  threadDelay (10000000000)
  f $ responseLBS status200 [(hContentType, "application/json")] "{\"host\":\"127.0.0.1\", \"port\":5055}"
