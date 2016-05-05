-- | Date Experiments


-- <http://two-wrongs.com/haskell-time-library-tutorial>

module Misc.Dates where

import Data.Time
import Data.Time.Clock.POSIX
-- import Data.Time.LocalTime

----------------------------
-- Dates -------------------
-- Day a type

-- create a date
-- fromGregorianValid :: Integer -> Int -> Int -> Maybe
-- fromGregorian year month day -> Day

d1 :: Maybe Day
d1  = fromGregorianValid 2008 10 22
--- Just 2008-10-22

-- convert a day back to a triple
-- toGregorian :: Day -> (Intger, Int, Int)

conv :: Maybe Day -> (Integer, Int, Int)
conv dy =  case dy of
        Nothing  -> (0,0,0)
        Just d   -> toGregorian d

d2 :: (Integer, Int, Int)
d2 = conv d1
-- (2008,10,22)

sd2 :: String
sd2  = show d1
-- "Just 2008-10-22"


-- add or subtract number of days to a Day
-- addDays :: Integer -> Day -> Day

today,oneWeek :: Day
today = fromGregorian 2015 8 30

oneWeek = addDays 7 today
-- 2015-09-06


-- difference between two days
-- diffDays diffDays :: Day -> Day -> Integer

someDay :: Day
someDay  = fromGregorian 2015 9 30

nd2 :: Integer
nd2  = diffDays someDay today
-- 31

-- adding or subracting months adusting
-- addGregorianMonthsClip :: Integer -> Day -> Day

clientRegestered :: Day
clientRegestered  = fromGregorian 2015 5 31

billD1 :: Day
billD1  = addGregorianMonthsClip  1 clientRegestered
-- 2015-06-30

mp :: [Day]
mp  = map (\n -> addGregorianMonthsClip n clientRegestered) [1..12]
-- [2015-06-30,2015-07-31,
--  2015-08-31,2015-09-30,
--  2015-10-31,2015-11-30,
--  2015-12-31,2016-01-31,
--  2016-02-29,2016-03-31,
--  2016-04-30,2016-05-31]


----------------------------
-- Universal time ----------

tm1,tm2,tm3 :: UTCTime
tm1  = UTCTime today 0
-- 2015-08-30 00:00:00 UTC

tm2  = UTCTime today (12*60*60 + 34*60 + 56)
-- 2015-08-30 12:34:56 UTC

tm3  = UTCTime today (calcSeconds 12 34 56)
-- 2015-08-30 12:34:56 UTC

-- UTCTime  a type
-- NominalDiffTime - number of seconds as a type

-- getCurrentTime :: IO UTCTime

now2, latter :: IO UTCTime
now2 = getCurrentTime
-- 2016-05-05 04:28:38.154 UTC  -- or whatever, not a function

----------------------------
-- Computation -------------

-- compute new times based on num of seconds
-- addUTCTime :: NominalDiffTime -> UTCTime -> UTCTime

-- number of seconds between two times
-- diffUTCTime :: UTCTime -> UTCTime -> NominalDiffTime


latter = getCurrentTime

--diff4 :: NominalDiffTime
--diff4  = diffUTCTime latter now  -- wrong type IO

-- converts any number to a NominalDiffTime
-- realToFrac :: (Fractional b, Real a) => a -> b

-- you can pattern matchon UTCTime

----------------------------
-- local time

-- ZonedTime - local time value type

-- TimeZone -  value representing the users timezone;
-- it can be pattern matched out from a local time value

-- zonedTimeToUTC :: ZonedTime -> UTCTime
-- converts a local time value to universal time

-- utcToZonedTime :: TimeZone -> UTCTime -> ZonedTime
-- converts a universal time value to local time, given a timezone
-- for the local time

-- getZonedTime :: IO ZonedTime
-- gets the current local time for the user


----------------------------
-- formatting --------------

-- TimeLocale - is a value that contains, among other things,
-- translations of the weekday names to the users language

-- defaultTimeLocale - contains the English names of weekdays among
-- other things; can be modified if you don't want to create a
-- time locale from scratch

-- formatTime :: FormatTime t => TimeLocale -> String -> t -> String
-- formats a date or time value according to the format string
-- and locale specified





----------------------------
----------------------------

-- seconds

t1,t2,t3,t4 :: DiffTime

t1 = fromIntegral 10  -- 10 seconds

t2 = fromRational 2.253 -- 2253 milliseconds

t3 = secondsToDiffTime 10  -- 10 seconds

t4 = picosecondsToDiffTime 2253000000000 -- 2253 milliseconds

-- seconds to time


unixTime :: POSIXTime
unixTime  = fromIntegral 10 :: POSIXTime

-- Converting POSIXTime to and from UTCTime
utctime :: UTCTime -- 10 seconds after unix epoch.
utctime  = posixSecondsToUTCTime $ fromIntegral 10


-- Localization

tz :: TimeZone
tz  = hoursToTimeZone 2  -- create a +0200 timezone


-- convert UTCTime back and forth to a ZonedTime

time :: UTCTime
time = posixSecondsToUTCTime $ fromIntegral 10

ztime :: ZonedTime
ztime = utcToZonedTime tz utctime


-- Current time

t5 :: IO UTCTime
t5  = getCurrentTime :: IO UTCTime

t6 :: IO TimeZone
t6  = getCurrentTimeZone :: IO TimeZone

t7 :: IO ZonedTime
t7  = getZonedTime :: IO ZonedTime

t8 :: IO POSIXTime
t8  = getPOSIXTime


-- Adding or subracting
now :: IO UTCTime
now = getCurrentTime

--(y,m,d) = toGregorian $ utctDay now

-- Formatting time

time2 :: UTCTime
time2  = posixSecondsToUTCTime $ fromIntegral 10

str :: String
str  = formatTime defaultTimeLocale "%c" time2
-- "Thu Jan  1 00:00:10 UTC 1970"


-- some utility functions

-- | Calculate the number of seconds given Hrs, Mns, Scs
calcSeconds ::  DiffTime -> DiffTime ->
                DiffTime -> DiffTime
calcSeconds hrs mns scs =   ((hrs*60*60) + (mns*60) + scs)

-- | Calculate the days from beginning of year to now
--   and days until end of year

calcSpread  :: Integer -> Int -> Int -> (Integer,Integer)
calcSpread yr mnth day = ((diffDays now1 jan01)+1, (diffDays dec31 now1)+1)
  where now1  = fromGregorian yr mnth day
        jan01 = fromGregorian (yr) 1 1
        dec31 = fromGregorian (yr) 12 31
