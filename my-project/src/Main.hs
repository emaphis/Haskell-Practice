module Main where

action :: IO ()
action = putStrLn "Hello World"

sayHello :: IO String
sayHello = do
  name <- getLine
  putStrLn ("Hello " ++ name)
  return name

beCareful :: Maybe Int
beCareful = do
  Just 6
--  putStrLn "oops"
  Nothing
  return 5

main :: IO ()
main = do
  let action1 = putStrLn "Hello World"
  action1
  action1
  action
  return ()
