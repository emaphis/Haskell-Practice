-- | Creditcard.hs - Credi Card validation homework

module Week01.Creditcard where

-- Create toDigits

toDigits :: Integer -> [Integer]
toDigits n = reverse (toDigitsRev n)

toDigitsRev :: Integer -> [Integer]
toDigitsRev n
  | n <= 0    = []
  | otherwise = n `mod` 10 :  toDigitsRev (n `div` 10)

testToDigits :: Bool
testToDigits =
  null (toDigits 0)       &&
  toDigits 1  == [1]      &&
  toDigits 1234 == [1,2,3,4] &&
  toDigitsRev 1234 == [4,3,2,1]


-- uses double recursion
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther (n:ns) =
  if odd (length (n:ns))
     then n : doubleEveryOther' ns
     else doubleEveryOther' (n:ns)
  where
    doubleEveryOther' []     = []
    doubleEveryOther' (x:xs) =  (2*x) : doubleEveryOther xs


sumDigits :: [Integer] -> Integer
sumDigits []     = 0
sumDigits (x:xs) = if (x `div` 10) > 0
                   then 1 + (x `mod` 10) + sumDigits xs
                   else x + sumDigits xs

validate :: Integer -> Bool
validate n = sumDigits (doubleEveryOther (toDigits n)) `mod` 10  == 0

something :: Integer -> Integer
something n = sumDigits (doubleEveryOther (toDigitsRev n))
