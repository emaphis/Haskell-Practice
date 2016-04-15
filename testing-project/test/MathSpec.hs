-- | Math unit tests

module MathSpec where

import Test.Hspec
import Math (absolute)

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "absolute" $ do
    it "returns the original number when given a positive input" $
      absolute 1 `shouldBe` 1
      
    it "returns a positive number when given a nagative input" $
      absolute (-1) `shouldBe` 1

    it "returns zero when given zero" $
      absolute 0 `shouldBe` 0

