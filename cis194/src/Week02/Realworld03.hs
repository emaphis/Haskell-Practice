-- | Realworld Haskell chapter 3
--   Defining functions

module Week02.Realworld03 where

-- See Distinction.hs, Bool.hs, BookStore.hs, AlgerbraicVector.hs Add.hs for examples


-- tuple destructuring
third :: (a,b,c) -> c
third (_,_,c) = c

complicated :: (Eq d, Num d) => (Bool, b, [c], d) -> (b, [c])
complicated (True, a, _:xs, 5) = (a, xs)
complicated (False, a, x:xs, 5) = (a, (x:xs))


sumInt :: Integer -> Integer
sumInt 1 = 1
sumInt n = n + sumInt (n-1)
