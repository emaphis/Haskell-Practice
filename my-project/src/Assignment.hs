-- | JSON encoder
--   encode a List of Int

module Assignment where

import Data.Aeson (encode)

numbers :: [Int]
numbers = [1,2,3,4]

main :: IO ()
main = do
  print (encode numbers)

