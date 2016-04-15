-- | Unit testing head 
--   doesn't test testing-project funtionality

module HeadSpec where

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

main:: IO ()
main = hspec $ do
  describe "Prelude.head" $ do
    it "returns the firs element of a list" $ do
      head [23 ..] `shouldBe` (23 :: Int)

    it "returns the first element of an 'arbitrary' list" $
      property $ \x xs -> head (x:xs) == (x :: Int)

    it "throwss an exception if ued with an empty list" $ do
      evaluate (head []) `shouldThrow` anyException
 
