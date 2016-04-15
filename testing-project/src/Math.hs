-- | Math module implementation

module Math where

absolute :: Int -> Int
absolute n
  | n < 0     = -n
  | otherwise = n
