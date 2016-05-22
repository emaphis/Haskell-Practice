-- | More date practice
--   <http://tab.snarc.org/posts/haskell/2011-12-16-date-in-haskell.html>

module Misc.Dates2 where

import Data.Time
import Data.Time.Clock.POSIX


-- In the beginning there was seconds

dt1, dt2, dt3, dt4 :: DiffTime

-- 10 seconds value
dt1 = fromIntegral 10 :: DiffTime

-- 2253 milliseconds
dt2 = fromRational 2.253 :: DiffTime

-- dedicated conversion functions
dt3 = secondsToDiffTime 10  -- 10 seconds
dt4 = picosecondsToDiffTime 2253000000000 -- 2253 milliseconds


-- Seconds to time
-- number of seconds since 1st of january 1970 

-- 10 seconds after Unix EPOCK
unixTime :: POSIXTime  -- alias for NominalDiffTime
unixTime = fromIntegral 10 :: POSIXTime

-- Converting POSIXTime to and from UTCTime
utctime :: UTCTime  -- the main type for tracking time in Haskell
utctime = posixSecondsToUTCTime $ fromIntegral 10
-- utcTimeToPOSIXSeconds


-- Localization - fit for humans

tz1 :: TimeZone
tz1 = hoursToTimeZone 2  -- create a +0200 timezone

-- convert between UTCTime  ZonedTime using the utcToZonedTime
-- and zonedTimeToUTC functions.

dt6 :: UTCTime
dt6 = posixSecondsToUTCTime $ fromIntegral 10
-- 1970-01-01 00:00:10 UTC

tzt1 :: ZonedTime
tzt1 = utcToZonedTime tz1 dt6
-- 1970-01-01 02:00:10 +0200


-- Current time

-- getCurrentTime :: IO UTCTime
-- getCurrentTimeZone :: IO TimeZone
-- getZonedTime :: IO ZonedTime
-- getPOSIXTime :: IO POSIXTime
