-- | Math module implementation

module Math where

absolute :: Int -> Int
absolute = undefined

toDigits :: Integer -> [Integer]
toDigits n =
  if 0 <= n && n <= 10
  then [n]
  else toDigits ((n - n `mod` 10) `quot` 10) ++ [n `mod` 10]
