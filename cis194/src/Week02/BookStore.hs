-- | Bookstore Example

module Week02.BookStore where

data BookInfo = Book Integer String [String]
                deriving (Show)

data MagazineInfo = Magazine Integer String [String]
                    deriving (Show)

-- Type synonyms
type CustomerID = Int
type CardHolder = String
type CardNumber = String
type Address = [String]
type ReviewBody = String

data BookReview = BookReview BookInfo CustomerID String

data BetterReview = BetterReview BookInfo CustomerID ReviewBody


myInfo :: BookInfo
myInfo = Book 9780135072455 "Algerbra of Programming"
  ["Richard Bird", "Oege de Moor"]

type BookRecord = (BookInfo, BookReview)

data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDelivery
                 | Invoice CustomerID
  deriving (Show)


sumInt :: Integer -> Integer
sumInt 1 = 1
sumInt n = n + sumInt (n-1)
