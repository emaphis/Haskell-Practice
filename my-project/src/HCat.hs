-- | HCat -- Haskell 'cat' command

module HCat where

import System.Environment (getArgs)

main :: IO ()
main = do
  [file] <- getArgs
  stuff <- readFile file
  putStrLn stuff
