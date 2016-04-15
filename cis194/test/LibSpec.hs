-- | Unit tests

module LibSpec where

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

import Lib (add1)

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "Lib testing" $ do
    describe "Prelude.head" $ do
      it "returns the first element of a list" $ do
        head [23 ..] `shouldBe` (23 :: Int)

      it "returns the first element of an *arbitrary* list" $
        property $ \x xs -> head (x:xs) == (x :: Int)

      it "throws an exception if used with an empty list" $ do
        evaluate (head []) `shouldThrow` anyException

      describe "testing Lib.add1" $ do
        it "returns 1 when applied to 0" $ do
          add1 0 `shouldBe` 1

        it "always adds 1 to a given number" $ do
          property $ \x -> add1 x == (x + 1)
