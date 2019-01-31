module ParallelTest where

import Protolude
import Gauge.Main
import Control.Parallel.Strategies

input :: [[Integer]]
input = map (\_ -> [1..100000]) [1..100000]

test :: [[Integer]] -> [Integer]
test = map (foldl (+) 0) 

testPar :: [[Integer]] -> [Integer]
testPar = parMap rdeepseq (foldl (+) 0) 

main :: IO ()
main = defaultMain [
  bgroup "test"
    [ bench "normal" $ whnf test input
    , bench "parallel" $ whnf test input
    ]
  ]