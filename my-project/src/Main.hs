module Main where

action :: IO ()
action = putStrLn "Hello World"

main :: IO ()
main = do
  action
  action
  action
  return ()
