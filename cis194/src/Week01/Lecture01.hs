-- | Lecture for Week 1

module Week01.Lecture01 where

-- declaration
x1 :: Int
x1 = 3

-- Note that normal (non-literate) comments are preceded by two hyphens
{- or enclosed
   in curly brace/hyphen pairs. -}

-- Machine sized integers
i :: Int
i = -78

biggestInt, smallestInt :: Int
biggestInt  = maxBound
smallestInt = minBound

-- Arbitrary-precision integers
n1 :: Integer
n1 = 1234567890987654321987340982334987349872349874534

reallyBig :: Integer
reallyBig = 2^(2^(2^(2^2)))

numDigits :: Int
numDigits = length (show reallyBig)

-- Double-precision floating point
d1, d2 :: Double
d1 = 4.5387
d2 = 6.2831e-4

-- Types have to match:
i3 :: Int
n3 :: Integer
d3 :: Double

i3 = 1
n3 = 2
d3 = 3.0

n4 = i3 * i3
-- n5 = i3 * n3  -- Couldn't match expected type `Int' with actual type `Integer'
-- n6 = i3 * d3  -- Couldn't match expected type `Int' with actual type `Double'

-- Booleans
b1, b2 :: Bool
b1 = True
b2 = False

-- Unicode characters
--c1, c3 :: Char
--c1 = 'x'
-- c2 = 'Ø'
--c3 = '?'

-- Conversions
-- toInteger :: Integral a => a -> Integer
i5, j5  :: Int
i5 = 4
j5 = 6

-- ex1 = i5/j5 -- No instance for (Fractional Int) arising from a use of `/'
-- ex2 = (fromInteger i5) / (fromInteger j5)
ex3 = i5 `div` j5


-- Strings are lists of characters with special syntax
s :: String
s = "Hello, Haskell!"


-- Functions

-- Compute the sum of the integers form 1 to n
sumtorial :: Integer -> Integer
sumtorial 0 = 0
sumtorial n = n + sumtorial (n-1)

hailstone :: Integer -> Integer
hailstone n
   | n `mod` 2 == 0 = n `div` 2
   | otherwise      = 3*n + 1

-- a more complex (but more contrived) example:
foo :: Integer -> Integer
foo 0 = 16
foo 1
  | "Haskell" > "C++" = 3
  | otherwise         = 4
foo n
  | n < 0            = 0
  | n `mod` 17 == 2  = -43
  | otherwise        = n + 3


isEven :: Integer -> Bool
isEven n
  | n `mod` 2 == 0 = True
  | otherwise      = False


-- Pairs

p :: (Int, Char)
p = (3, 'x')

sumPair :: (Int, Int) -> Int
sumPair (x,y)  = x + y

-- Functions with multiple arguements
f :: Int -> Int -> Int -> Int
f x y z = x + y + z

ext17 :: Int
ext17 = f 3 17 8

-- Lists
-- Lists are one of the most basic data types in Haskell.

nums, range, range2 :: [Integer]
nums   = [1,2,3,19]
range  = [1..100]
range2 = [2,4..100]

-- hello1 and hello2 are exactly the same.

hello1 :: [Char]
hello1 = ['h', 'e', 'l', 'l', 'o']

hello2 :: String
hello2 = "hello"

-- Constructing Lists
emptyList = []

ex18 = 1 : []
ex19 = 3 : (1 : [])
ex20 = 2 : 3 : 4 : []
ex21 = [2,3,4] == 2 : 3 : 4 : []

-- Generate the sequence of hailstone iterations from a starting number.
hailstoneSeq :: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)

-- Functions on Lists

-- Compute the length of a a list of Integers
intListLength :: [Integer] -> Integer
intListLength []     = 0
intListLength (_:xs) = 1 + intListLength xs

-- Nested Paterens
sumEveryTwo :: [Integer] -> [Integer]
sumEveryTwo []         = []  -- Do nothing to the empty list
sumEveryTwo (x:[])     = [x] -- Do nothing to lists with a single element
sumEveryTwo (x:(y:zs)) = (x+y) : sumEveryTwo zs

-- Pairs inside lists owrk as well
sumPairs :: [(Integer, Integer)] -> [Integer]
sumPairs []         = []
sumPairs ((x,y):zs) = x+y : sumPairs zs

-- Combining Functions

-- The number of hailstone steps needed to reach 1 from a
-- starting number
hailstoneLen :: Integer -> Integer
hailstoneLen n = intListLength (hailstoneSeq n) - 1

-- Homeworkd

-- Credit Card Validation
-- broken down into a lot of functions
-- think about recrusive parts

-- Tower of Hanoi
