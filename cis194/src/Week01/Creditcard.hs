-- | Creditcard.hs - Credi Card validation homework

module Week01.Creditcard where

-- Create toDigits

toDigits :: Integer -> [Integer]
toDigits n = reverse (toDigitsRev n)

toDigitsRev :: Integer -> [Integer]
toDigitsRev n
  | n < 0     = error "Number must be positive"
  | n == 0    = []
  | otherwise = n `mod` 10 :  toDigitsRev (n `div` 10)

testToDigits :: Bool
testToDigits =
  null (toDigits 0)       &&
  toDigits 1  == [1]      &&
  toDigits 1234 == [1,2,3,4] &&
  toDigitsRev 1234 == [4,3,2,1]


--
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther []       = []
doubleEveryOther [x]      = [x]
doubleEveryOther (x:y:zs) = x : (2*y) : doubleEveryOther zs


sumDigits :: [Integer] -> Integer
sumDigits []     = 0
sumDigits (x:xs) = if (x `div` 10) > 0
                   then 1 + (x `mod` 10) + sumDigits xs
                   else x + sumDigits xs

validate :: Integer -> Bool
validate n = sumDigits (doubleEveryOther (toDigitsRev n)) `mod` 10  == 0

something :: Integer -> Integer
something n = sumDigits (doubleEveryOther (toDigitsRev n))
