-- | Bookstore Example

module Week02.BookStore where

data BookInfo = Book Integer String [String]
                deriving (Show)

data MagazineInfo = Magazine Integer String [String]
                    deriving (Show)

myInfo :: BookInfo
myInfo = Book 9780135072455 "Algerbra of Programming"
  ["Richard Bird", "Oege de Moor"]
