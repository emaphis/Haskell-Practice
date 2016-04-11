-- | HSpec tests

import Test.Hspec
import Test.QuickCheck  -- for Queckcheck example
import Control.Exception (evaluate)


main :: IO ()
main = hspec spec

-- Spec example
spec :: Spec
spec = do
  describe "reverse" $ do
    it "reverses a list" $                    -- textual dexription
      reverse [1, 2, 3] `shouldBe` [3, 2, 1]  -- an example

    it "gives the original list if applied twice" $
      property $ \xs ->
        (reverse . reverse) xs == (xs :: [Int])

-- spec :: Spec
-- spec = do
--   describe "Prelude.head" $ do
--     it "returns the first element of a list" $ do
--       head [23 ..] `shouldBe` (23 :: Int)

--     it "returns the first element of an *arbitrary* list" $
--       property $ \x xs -> head (x:xs) == (x :: Int)

--     it "throws an exception if used with an empty list" $ do
--       evaluate (head []) `shouldThrow` anyException
