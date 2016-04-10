-- | printn - prints a message a given number of times

module Printn where

import Control.Monad (replicateM_)

main :: IO ()
main  = do
  msg <- getLine
  num <- readLn
  replicateM_ num (putStrLn msg)


