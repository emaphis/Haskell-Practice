-- | Unit tests for Credit Card

module Week01.CreditcardSpec where

import Test.Hspec

import Week01.Creditcard

main :: IO ()
main = hspec spec


spec :: Spec
spec =
  describe "Credit Card Tests" $ do
    describe "testing toDigits" $ do
      it "toDigits 0 == []" $
        toDigits 0 `shouldBe` []

      it "toDigits 1 == [1]" $
        toDigits 1 `shouldBe` [1]

      it "toDigits 1234" $
         toDigits 1234 `shouldBe` [1,2,3,4]

    describe "testing toDigitsRev" $ do
      it "returns an empty list given 0" $
        toDigitsRev 0 `shouldBe` []
      it "returns a list of one give a singel digit" $
        toDigitsRev 4 `shouldBe` [4]
      it "returns a list of digits reveresed given a number" $
        toDigitsRev 1234 `shouldBe` [4,3,2,1]

    describe "doubleEveryOther" $ do
      it "returns [] given []" $
         doubleEveryOther [] `shouldBe` []
      it "returns [1] given [1]" $
        doubleEveryOther [1] `shouldBe` [1]
      it "is one example from the homework" $
        doubleEveryOther [8,7,6,5] `shouldBe` [16,7,12,5]
      it "is the second example from the homework" $
        doubleEveryOther [1,2,3] `shouldBe` [1,4,3]
      it "is another example from the homework" $
        doubleEveryOther [1,3,8,6] `shouldBe` [2,3,16,6]

    describe "sumDigits" $ do
      it "returns 0 for an empty list of integers" $
        sumDigits [] `shouldBe` 0
      it "sums a list of single digits" $
        sumDigits [1,2,3] `shouldBe` 6
      it "sums the single digits fo numbers > than 10" $
        sumDigits [16,7,12,5] `shouldBe` 22

    describe "validate" $ do
      it "homework example 1" $
        validate 4012888888881881 `shouldBe` True
      it "homework example 2" $
        validate 4012888888881882 `shouldBe` False
