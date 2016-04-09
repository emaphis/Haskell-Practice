module Main where

greet :: String -> String
greet name = "Hello " ++ name ++ "!"

main :: IO ()
main = do
  putStrLn "Enter your name:"
  name <- getLine
  putStrLn (greet name)
  putStrLn (greet "World")
