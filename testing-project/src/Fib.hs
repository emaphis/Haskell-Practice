-- file Fib.hs

module Fib (fib) where

-- | Calulate Fibonacci numbers
--
-- >>> fib 10
-- 55
fib :: Int -> Integer
fib n | n < 0     = 0
      | otherwise = fibs !! n

fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

-- take 10 fibs
-- [0,1,1,2,3,5,8,13,21,34]
