-- | Some miscelaneous calculations

module Misc.Calcs where

import Data.List.Split (splitOn)
import qualified Data.Map as M
import Data.Char

-- Simple English
seMap :: M.Map Char Integer
seMap = M.fromList
  [(' ', 0),
   ('-', 0),
   ('.', 0),
   ('!', 0),
   ('?', 0),
   ('A', 1),
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

-- English
enMap :: M.Map Char Integer
enMap = M.fromList
  [(' ', 0),
   ('-', 0),
   ('.', 0),
   ('!', 0),
   ('?', 0),
   ('A', 6),
   ('B', 12),
   ('C', 18),
   ('D', 24),
   ('E', 30),
   ('F', 36),
   ('G', 42),
   ('H', 48),
   ('I', 54),
   ('J', 60),
   ('K', 66),
   ('L', 72),
   ('M', 78),
   ('N', 84),
   ('O', 90),
   ('P', 96),
   ('Q', 102),
   ('R', 108),
   ('S', 114),
   ('T', 120),
   ('U', 126),
   ('V', 132),
   ('W', 138),
   ('X', 144),
   ('Y', 150),
   ('Z', 156)]

-- Simple Pythagorean
pyMap :: M.Map Char Integer
pyMap = M.fromList
  [(' ', 0),
   ('-', 0),
   ('.', 0),
   ('!', 0),
   ('?', 0),
   ('A', 1),
   ('B', 2),
   ('C', 3),
   ('D', 4),
   ('E', 5),
   ('F', 6),
   ('G', 7),
   ('H', 8),
   ('I', 9),
   ('J', 1),  -- 1+0
   ('K', 2),  -- 2/11 - 1+1 = 2
   ('L', 3),  -- 1+2
   ('M', 4),  -- 1+3
   ('N', 5),
   ('O', 6),
   ('P', 7),
   ('Q', 8),
   ('R', 9),  -- 1+8 = 9
   ('S', 1),  -- 1/10 - 1+9 = 10 = 1+0 = 1
   ('T', 2),  -- 2+0
   ('U', 3),  -- 2+1
   ('V', 4),  -- 4/22 - 2+2 = 4
   ('W', 5),  -- 2+3
   ('X', 6),  -- 2+4
   ('Y', 7),  -- 2+5
   ('Z', 8)]  -- 2+6

-- Pythagorean S Exception
psMap :: M.Map Char Integer
psMap = M.fromList
  [(' ', 0),
   ('-', 0),
   ('.', 0),
   ('!', 0),
   ('?', 0),
   ('A', 1),
   ('B', 2),
   ('C', 3),
   ('D', 4),
   ('E', 5),
   ('F', 6),
   ('G', 7),
   ('H', 8),
   ('I', 9),
   ('J', 1),  -- 1+0
   ('K', 2),  -- 2/11 - 1+1 = 2
   ('L', 3),  -- 1+2
   ('M', 4),  -- 1+3
   ('N', 5),
   ('O', 6),
   ('P', 7),
   ('Q', 8),
   ('R', 9),  -- 1+8 = 9
   ('S', 10), -- 1/10 - 1+9 = 10 = 1+0 = 1
   ('T', 2),  -- 2+0
   ('U', 3),  -- 2+1
   ('V', 4),  -- 4/22 - 2+2 = 4
   ('W', 5),  -- 2+3
   ('X', 6),  -- 2+4
   ('Y', 7),  -- 2+5
   ('Z', 8)]  -- 2+6


-- Pythagorean All Exceptions
pxMap :: M.Map Char Integer
pxMap = M.fromList
  [(' ', 0),
   ('-', 0),
   ('.', 0),
   ('!', 0),
   ('?', 0),
   ('A', 1),
   ('B', 2),
   ('C', 3),
   ('D', 4),
   ('E', 5),
   ('F', 6),
   ('G', 7),
   ('H', 8),
   ('I', 9),
   ('J', 1),  -- 1+0
   ('K', 11), -- 2/11 - 1+1 = 2
   ('L', 3),  -- 1+2
   ('M', 4),  -- 1+3
   ('N', 5),
   ('O', 6),
   ('P', 7),
   ('Q', 8),
   ('R', 9),  -- 1+8 = 9
   ('S', 10), -- 1/10 - 1+9 = 10 = 1+0 = 1
   ('T', 2),  -- 2+0
   ('U', 3),  -- 2+1
   ('V', 22), -- 4/22 - 2+2 = 4
   ('W', 5),  -- 2+3
   ('X', 6),  -- 2+4
   ('Y', 7),  -- 2+5
   ('Z', 8)]  -- 2+6

-- Hebrew
heMap :: M.Map Char Integer
heMap = M.fromList
  [(' ', 0),
   ('-', 0),
   ('.', 0),
   ('A', 1),
   ('B', 2),
   ('C', 3),
   ('D', 4),
   ('E', 5),
   ('F', 6),
   ('G', 7),
   ('H', 8),
   ('I', 9),
   ('J', 600),
   ('K', 10),
   ('L', 20),
   ('M', 30),
   ('N', 40),
   ('O', 50),
   ('P', 60),
   ('Q', 70),
   ('R', 80),
   ('S', 90),
   ('T', 100),
   ('U', 200),
   ('V', 700),
   ('W', 900),
   ('X', 300),
   ('Y', 400),
   ('Z', 500)]

-- Bacon Gematria
-- a-z = 1-26
-- A-Z = 27-52
bcMap :: M.Map Char Integer
bcMap = M.fromList
  [(' ', 0),
   ('-', 0),
   ('.', 0),
   ('!', 0),
   ('?', 0),
   ('a', 1),
   ('b', 2),
   ('c', 3),
   ('d', 4),
   ('e', 5),
   ('f', 6),
   ('g', 7),
   ('h', 8),
   ('i', 9),
   ('j', 10),
   ('k', 11),
   ('l', 12),
   ('m', 13),
   ('n', 14),
   ('o', 15),
   ('p', 16),
   ('q', 17),
   ('r', 18),
   ('s', 19),
   ('t', 20),
   ('u', 21),
   ('v', 22),
   ('w', 23),
   ('x', 24),
   ('y', 25),
   ('z', 26),
   ('A', 27),
   ('B', 28),
   ('C', 29),
   ('D', 30),
   ('E', 31),
   ('F', 32),
   ('G', 33),
   ('H', 34),
   ('I', 35),
   ('J', 35),
   ('K', 37),
   ('L', 38),
   ('M', 39),
   ('N', 40),
   ('O', 41),
   ('P', 42),
   ('Q', 43),
   ('R', 44),
   ('S', 45),
   ('T', 46),
   ('U', 47),
   ('V', 48),
   ('W', 49),
   ('X', 50),
   ('Y', 51),
   ('Z', 52)]


-- divide text into a list of words
getWords :: String -> [String]
getWords txt = splitOn " " txt

-- getWords "lets go on a balloon ride"
-- ["lets","go","on","a","balloon","ride"]

-- calc gematria given a word and a table
calc :: M.Map Char Integer -> String  -> Maybe [Integer]
calc gMap str = (mapM (\c -> M.lookup c gMap) (map toUpper str))


-- calculate Simple English, Pythagorean, Jewish, Pythagorian S,
-- Pythagorean Exceptions, Bacon
calcSE,calcPY,calcHE,calcPS,calcPX,calcBC
  :: String -> Maybe [Integer]
calcSE str = calc seMap str
calcPY str = calc pyMap str
calcHE str = calc heMap str
calcPS str = calc psMap str
calcPX str = calc pxMap str
calcBC str = mapM (\c -> M.lookup c bcMap) str

-- > calcSE "balloon"
--   Just [2,1,12,12,15,15,14]
-- > calcPY "balloon"
--   Just [2,1,3,3,6,6,5]
-- > calcHE "balloon"
--   Just [2,1,20,20,50,50,40]

-- calculate the sum of Simple English, Simple Pythagorean, S Pythagorean,
-- Pathagorean with Exceptions, Jewish, Bacon
sumSE,sumPY,sumHE,sumPS,sumPX,sumBC  :: String -> Integer
sumSE str = sumM (calcSE str)
sumPY str = sumM (calcPY str)
sumHE str = sumM (calcHE str)
sumPS str = sumM (calcPS str)
sumPX str = sumM (calcPX str)
sumBC str = sumM (calcBC str)

-- calculate the geometria of a list of words
calcGem :: [String] -> [(String, Integer, Integer, Integer)]
calcGem xs = map (\s -> (s, sumSE s, sumPY s, sumHE s)) xs

-- > calcGem ["lets","go","on","a", "balloon", "ride"]
-- [("lets",56,11,215),("go",22,13,57),("on",29,11,90),("a",1,1,1),("balloon",71,26,183),("ride",36,27,98)]

-- calculate the Pythagorean of a list of words
calcPythagorean :: [String] -> [(String, Integer, Integer, Integer)]
calcPythagorean xs = map (\s -> (s, sumPY s, sumPS s, sumPX s)) xs

-- calculate the Bacon of a list of words
calcBacon :: [String] -> [(String, Integer)]
calcBacon xs = map (\s -> (s, sumBC s)) xs


-- given some text find the SE gematria
findGematria :: String -> [(String, Integer, Integer, Integer)]
findGematria txt = calcGem (getWords txt)

-- > findGematria "lets go on a balloon ride"
--   [("lets",56,11,215),("go",22,13,57),("on",29,11,90),("a",1,1,1),("balloon",71,26,183),("ride",36,27,98)]

-- given some text find the Pythogorean gematria
findPythagorean :: String -> [(String, Integer, Integer,Integer)]
findPythagorean txt = calcPythagorean (getWords txt)

-- given a String of text find the Bacon gematria
findBacon :: String -> [(String, Integer)]
findBacon txt = calcBacon (getWords txt)


-- Nicely fomated report
printGematria ::  String -> IO ()
printGematria txt = do
  printGemLines txt
  printGemTotal txt

printGemLines :: String -> IO ()
printGemLines txt = mapM_ printEach (findGematria txt)

printGemTotal :: String -> IO ()
printGemTotal txt = printEach (txt, sumSE txt, sumPY txt, sumHE txt)

printPythagorian :: String -> IO ()
printPythagorian txt = printEach (txt, sumPY txt, sumPS txt, sumPX txt)

printEach :: (String, Integer, Integer, Integer) -> IO ()
printEach (wrd,se,py,he) =
  putStrLn (wrd ++ " => " ++ show se ++ "/" ++  show py ++ "/" ++ show he)


-- sum a Maybe list of Integers
sumM :: Maybe [Integer] -> Integer
sumM val =
  case val of
    Nothing -> 0
    Just [] -> 0
    Just (x:xs) -> x + sumM (Just xs)


-- filtring example
fex :: [(String, Integer)]
fex = [("lets",56),("go",22),("on",29),("a",1),("balloon",71),("ride",36)]

-- > filter (\p -> even (snd p)) fex
--   [("lets",56),("go",22),("ride",36)]


-- filter a list of pairs based on the second Iteger component.
filterList :: (Integer -> Bool) -> [(String, Integer)] -> [(String, Integer)]
filterList prd lst = filter (\p -> prd (snd p)) lst


-- test for prime numbers
isPrime :: Integral a => a -> Bool
isPrime x = null (filter (\y ->  x `mod`y == 0) (takeWhile (\y ->  y*y <= x) [2..]))

