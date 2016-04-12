-- | LYAH Chapter 2 - Starting Out
-- <http://learnyouahaskell.com/starting-out>

module Week01.Lyah02 where

doubleMe :: Num a => a -> a
doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

-- double numbers smaller than 100
doubleSmallNumber x = if x > 100
                      then x
                      else x*2

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

lc2 = [x*y | x <-  [2,5,10], y <- [8,10,11]]

length' xs = sum [1 | _ <- xs]

removeNonUppercase str = [c | c <- str, c `elem` ['A'..'Z']]

-- triangles
triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]

rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]

rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24] 
