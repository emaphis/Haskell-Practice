-- | Various functions

module Misc.Stuff (fact,len) where

-- | Calculates the fatorial
fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n-1)


-- | Calculates the length of a list
len :: [a] -> Int
len [] = 0
len (_:xs) = 1 + len xs
