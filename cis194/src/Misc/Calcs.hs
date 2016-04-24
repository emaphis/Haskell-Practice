-- | Some miscelaneous calculations

module Misc.Calcs where

import Data.List.Split (splitOn)
import qualified Data.Map as M
import Data.Char
import Control.Monad

getWords :: String -> [String]
getWords txt = splitOn " " txt


findLengths :: String -> [(String, Int)]
findLengths txt = lengths (getWords txt)



lengths :: [String] -> [(String, Int)]
lengths xs = map (\x -> (x, length x)) xs

-- Simple English

map1 :: M.Map Char Integer
map1 = M.fromList

--map1 :: [(Char, Integer)]
--map1 = 
  [('A', 1),
   ('B', 2),
   ('C', 3),
   ('D', 4),
   ('E', 5),
   ('F', 6),
   ('G', 7),
   ('H', 8),
   ('I', 9),
   ('J', 10),
   ('K', 11),
   ('L', 12),
   ('M', 13),
   ('N', 14),
   ('O', 15),
   ('P', 16),
   ('Q', 17),
   ('R', 18),
   ('S', 19),
   ('T', 20),
   ('U', 21),
   ('V', 22),
   ('W', 23),
   ('X', 24),
   ('Y', 25),
   ('Z', 26)]


lft :: Maybe [Integer]
lft = (mapM (\x -> M.lookup x map1) (map toUpper "string") )

lst :: String -> Maybe [Integer]
lst str = do
  (mapM (\x -> M.lookup x map1) str)

-- sum a Maybe list of Integers
sumM :: Maybe [Integer] -> Integer
sumM val =
  case val of
    Nothing -> 0
    Just [] -> 0
    Just (x:xs) -> x + sumM (Just xs)
    
  

al :: [(Integer, [Char])]
al = [(1, "one"), (2, "two"), (3, "three"), (4, "four")]
