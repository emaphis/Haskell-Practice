-- | Add - an example of pattern matching
--   example from Realworld Haskell Chapter 03

module  Add where

myNot :: Bool -> Bool
myNot True  = False
myNot False = True


sumList :: [Int] -> Int
sumList (x:xs) = x + sumList xs
sumList []     = 0
