-- | Working with PostgreSQL and HDBC

module Lib
    ( someFunc, connect1
    ) where


import Database.HDBC
import Database.HDBC.PostgreSQL
import Data.Convertible

--connect :: String -> Int
connect1 :: String -> IO ()
connect1 who = do
  conn <- connectPostgreSQL "host=localhost dbname=mydb user=*** password=***"
  select <- prepare conn "SELECT * FROM weather"
  ret <- execute select []
  result <- fetchAllRows select
  commit conn
  disconnect conn
  putStrLn (show ret ++ " results for " ++ who)
  print result

-- This actually worked:
--  http://www.codefugue.com/moops-haskell-io-and-the-bubble-boy/
worked :: IO ()
worked = do
  io <- connectPostgreSQL "host=localhost dbname=mydb user=**** password=****"
  resultIO  <- quickQuery io "select count(*) from weather" []
 -- result <- resultIO
  print resultIO

-- create table the add a row
createT :: IO ()
createT = do
  conn <- connectPostgreSQL "host=localhost dbname=mydb user=**** password=****"
  _ <- run conn "CREATE TABLE test (id integer not null, desc1 varchar(80))" []
  ret <- run conn "INSERT INTO test (id) VALUES (-1)" []
  commit conn
  disconnect conn
  print ("inserted " ++ show ret ++ " records")


addRec :: IO ()
addRec = do
  conn <- connectPostgreSQL "host=localhost dbname=mydb user=*** password=***"
  ret <- run conn "INSERT INTO test VALUES (?,?)" [toSql (0::Int), toSql "zero"]
  commit conn
  disconnect conn
  print ("inserted " ++ show ret ++ " records")

-- prepared statements
prep1 :: IO ()
prep1 = do
  conn <- connectPostgreSQL "host=localhost dbname=mydb user=**** password=***"
  stmt <- prepare conn "INSERT INTO test VALUES (?,?)"
  r1 <- execute stmt [toSql (1::Int), toSql "one"]
  r2 <- execute stmt [toSql (2::Int), toSql "two"]
  r3 <- execute stmt [toSql (3::Int), toSql "three"]
  r4 <- execute stmt [toSql (4::Int), SqlNull]
  commit conn
  disconnect conn
  print ("inserted " ++ show (r1+r2+r3+r4) ++ " records")

-- execute many
exec1 :: IO ()
exec1 = do
  conn <- connectPostgreSQL "host=localhost dbname=mydb user=**** password=*****"
  stmt <- prepare conn "INSERT INTO test VALUES (?,?)"
  r1 <- executeMany stmt [[toSql (5::Int), toSql "fives's nice"], [toSql (6::Int), SqlNull]]
  commit conn
  disconnect conn
  print ("inserted records " ++ show r1)

-- reading data
readD :: IO ()
readD = do
  conn <- connectPostgreSQL "host=localhost dbname=mydb user=***** password=***"
  r1 <- quickQuery' conn "SELECT * FROM test WHERE id < 2" []
  disconnect conn
  print r1

-- lookup values based on a passed maximum value:
readD1 :: Int -> IO ()
readD1 maxId = do
  conn <- connectPostgreSQL "host=localhost dbname=mydb user=***** password=*****"
  r1 <- quickQuery' conn "SELECT id, desc1 FROM test WHERE id <= ? ORDER BY id, desc1" [toSql maxId]

  -- convert each row inot a String
  let stringRows = map convRow r1

  -- print the rows out
  mapM_ putStrLn stringRows

  disconnect conn

  where convRow :: [SqlValue] -> String
        convRow [sqlId, sqlDesc] =
          show intid ++ ": " ++ desc
          where intid = fromSql sqlId :: Integer
                desc  = case fromSql sqlDesc of
                          Just x  -> x
                          Nothing -> "NULL"
        convRow x = fail $ "Unexpected result: " ++ show x


someFunc :: IO ()
someFunc = putStrLn "someFunc"
