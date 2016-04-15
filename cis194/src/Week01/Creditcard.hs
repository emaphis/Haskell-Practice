-- | Creditcard.hs - Credi Card validation homework

module Week01.Creditcard where

-- Create to digits

toDigits :: Integer -> [Integer]
toDigits n
  | n <= 0    = []
  | otherwise = toDigits (n `div` 10) ++ [n `mod` 10]

toDigitsRev :: Integer -> [Integer]
toDigitsRev n
  | n <= 0    = []
  | otherwise = n `mod` 10 :  toDigitsRev (n `div` 10)

testToDigits :: Bool
testToDigits =
  null (toDigits 0)       &&
  null (toDigits (-17))   &&
  toDigits 1  == [1]      &&
  toDigits 1234 == [1,2,3,4] &&
  toDigitsRev 1234 == [4,3,2,1]


--
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther []       = []
doubleEveryOther [x]      = [x]
doubleEveryOther [x,y]    = [(2*x), y]
doubleEveryOther (x:y:zs) = x : (2*y) : doubleEveryOther zs

testDoubleEveryOther :: Bool
testDoubleEveryOther =
  doubleEveryOther [] == []  &&
  doubleEveryOther [1] == [1]
