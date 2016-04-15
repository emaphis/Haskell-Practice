-- | Unit tests for Misc functions

module Misc.StuffSpec where

import Test.Hspec

import Misc.Stuff


main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "fact" $ do
    it "returns 0 given 0" $
      fact 0 `shouldBe` 1

    it "returns 1 given 1" $
       fact 1 `shouldBe` 1

    it "returns 120 given 5" $
       fact 5 `shouldBe` 120

specLen :: Spec
specLen =
  describe "len" $ do
    it "returns 0 given an empty list" $
      len [] `shouldBe` 0

    it "returns 1 given a sigletary list" $
      len [1] `shouldBe` 1

    it "returns 3 given a list of 3 items" $
      len ['1','2','3'] `shouldBe` 3
