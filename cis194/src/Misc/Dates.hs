-- | Date Experiments

module Misc.Dates where

import Data.Time
import Data.Time.Clock.POSIX
-- import Data.Time.LocalTime

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


-- Formatting time

time2 :: UTCTime
time2  = posixSecondsToUTCTime $ fromIntegral 10

str :: String
str  = formatTime defaultTimeLocale "%c" time2
-- "Thu Jan  1 00:00:10 UTC 1970"

