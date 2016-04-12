-- | Main module

module Main where

import Lib (someFunc)
import Week01.Lyah02

main :: IO ()
main = do
  print (doubleUs 2.0 4.0)
  someFunc

