-- | Bookstore Example
--   example from Realworld Haskell Chapter 03

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

bookID :: BookInfo -> Integer
bookID      (Book bid _ _)  = bid

bookTitle :: BookInfo -> String
bookTitle   (Book _ title _)  = title

bookAuthors :: BookInfo -> [String]
bookAuthors (Book _ _ authors)  = authors


data Customer = Customer {
    customerID      :: CustomerID
  , customerName    :: String
  , customerAddress :: Address
  } deriving (Show)


customer2 :: Customer
customer2 = Customer {
              customerID = 271828
            , customerAddress = ["1048576 Disk Drive",
                                 "Milpitas, CA 95134",
                                 "USA"]
            , customerName = "Jane Q. Citizen"
            }
