-- | Tests for Week01/Hanoi

module Week01.HanoiSpec where

import Test.Hspec

import Week01.Hanoi

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "hanoi" $ do
    it "hanoi base case" $
      hanoi 0 "a" "b" "c" `shouldBe` []

    it "is a text examples" $
      hanoi 2 "a" "b" "c" `shouldBe`
      [("a","c"), ("a","b"), ("c","b")]
