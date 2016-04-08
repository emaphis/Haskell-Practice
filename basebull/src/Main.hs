-- | Main basebull module

module Main where

import Basebull

main :: IO ()
main = do
  summed <- getAtBatsSum "batting.csv"
  putStrLn $ "Total atBats was: " ++ show summed
