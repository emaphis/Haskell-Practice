-- | Test the Fibonacci function

module FibSpec (main, spec) where

import Control.Applicative
import Control.Exception
import System.Timeout

import Test.Hspec
import Test.QuickCheck  -- for Queckcheck example


import Fib

newtype Small' = Small' Int
              deriving Show

instance Arbitrary Small' where
  arbitrary = Small' . (`mod` 10) <$> arbitrary

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  it "calculates arbitrary Fibonacci numbers" $ do
    property $ \(Small n) ->
      fib n == fib (n + 2) - fib (n + 1)

  it "is efficient" $ do
    timeout 10000 (evaluate $ fib 32)
      `shouldReturn` Just 2178309
      
  it "returns 0 on negative input" $ do
    property $ \n -> n < 0 ==>
       fib n == 0
