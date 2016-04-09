module Main where

--import System.IO (readFile)
import Data.Time (getCurrentTime)

greet :: String -> String
greet name = "Hello " ++ name ++ "!"

printNumbers = do
  putStrLn (show (3+4))

printConfig = do
  contents <- readFile "stack.yaml"
  putStrLn contents

printTime = do
  time <- getCurrentTime
  putStrLn (show time)

main :: IO ()
main = do
  putStrLn (greet "bobby")
  putStrLn (greet "World")
  printNumbers
  printConfig
  printTime
