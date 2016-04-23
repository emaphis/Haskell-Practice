-- | Distinguishing between structurally same types 
--   example from Realworld Haskell Chapter 03

module Week01.Distinction where

a, b :: (String, String)  -- both of the same type
a = ("Porpoise", "Grey")
b = ("Table", "Oak")

data Cetacean = Cetacean String String
data Furnature = Furnature String String

-- now different types, but same structure
c :: Cetacean
c = Cetacean "Porpoise" "Grey"
d :: Furnature
d = Furnature "Table" "Oak"
