-- | More date practice
--   <http://tab.snarc.org/posts/haskell/2011-12-16-date-in-haskell.html>

module Misc.Dates2 where

import Data.Time
import Data.Time.Clock.POSIX

------------------------------------------
-- In the beginning there was seconds
-- seconds are the basis of time keeping
-- Data.Time.Clock

dTime1, dTime2, dTime3,dTime4 :: DiffTime

-- 10 seconds value
dTime1 = fromIntegral 10 :: DiffTime
-- 10s

-- 2253 milliseconds
dTime2 = fromRational 2.253 :: DiffTime
-- 2.253s

-- dedicated conversion functions
dTime3 = secondsToDiffTime 10  -- 10 seconds
dTime4 = picosecondsToDiffTime 2253000000000 -- 2253 milliseconds
-- 10s
-- 2.253s

---------------------------------------------------
-- Seconds to time
-- number of seconds since 1st of january 1970
-- Data.Time.Clock.POSIX

-- 10 seconds after Unix EPOCK
unixTime1 :: POSIXTime  -- alias for NominalDiffTime
unixTime1 = fromIntegral 10 :: POSIXTime
-- 10s

-- Converting POSIXTime to and from UTCTime
utcTime1 :: UTCTime  -- the main type for tracking time in Haskell
utcTime1 = posixSecondsToUTCTime $ fromIntegral 10
-- 1970-01-01 00:00:10 UTC

-- utcTimeToPOSIXSeconds


------------------------------------------------------
-- Localization - fit for humans
--  Data.Time.LocalTime

timeZ1 :: TimeZone
timeZ1 = hoursToTimeZone 2  -- create a +0200 timezone

-- convert between UTCTime  ZonedTime using the utcToZonedTime
-- and zonedTimeToUTC functions.


utcTime2 :: UTCTime
utcTime2 = posixSecondsToUTCTime $ fromIntegral 10
-- 1970-01-01 00:00:10 UTC

zoneTime1 :: ZonedTime
zoneTime1 = utcToZonedTime timeZ1 utcTime2
-- 1970-01-01 02:00:10 +0200

-------------------------------------------
-- Current time

-- getCurrentTime :: IO UTCTime
-- getCurrentTimeZone :: IO TimeZone
-- getZonedTime :: IO ZonedTime
-- getPOSIXTime :: IO POSIXTime

--------------------------------------------------
-- formating time

-- Data.Timn.Format
-- System.Locale

utcTime3 :: UTCTime
utcTime3 = posixSecondsToUTCTime $ fromIntegral 10
-- 1970-01-01 00:00:10 UTC

timeStr3 :: String
timeStr3 = formatTime defaultTimeLocale "%c" utcTime3
-- "Thu Jan  1 00:00:10 UTC 1970"


utcTime4 :: Maybe UTCTime
utcTime4 = parseTimeM True defaultTimeLocale "%c" "Thu Jan 1 00:00:10 UTC 1970" :: Maybe UTCTime
-- Just 1970-01-01 00:00:10 UTC


----------------------------------------------------
-- Organizing time
-- Data.Time.Calendar

day1 :: Day
day1 = fromGregorian 1970 1 1
-- 1970-01-01

year :: Integer
month, dayOfMonth :: Int
(year, month, dayOfMonth) = toGregorian day1


-- create a UTCTime from a Day and a DiffTime

utcTime5 :: UTCTime
utcTime5 = UTCTime (fromGregorian 2011 12 16) (fromIntegral $ 12 * 3600)
-- 2011-12-16 12:00:00 UTC

-- get parts of a UTCTime
day2 :: Day
day2 = utctDay utcTime5
-- 2011-12-16

diffTime2 :: DiffTime
diffTime2 = utctDayTime utcTime5
-- 43200s


----------------------------------------
-- At the end of time
