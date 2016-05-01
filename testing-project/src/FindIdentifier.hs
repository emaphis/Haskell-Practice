-- | More HUnit practice
--  --   tutoralial located at: <https://leiffrenzel.de/papers/getting-started-with-hunit.html>

module FindIdentifier (findIdentifier) where

import Data.List( sort )
import Data.Maybe
import Data.Generics
import Language.Haskell.Parser
import Language.Haskell.Syntax


findIdentifier :: String -> (Int, Int) -> Maybe String
findIdentifier []      _ = Nothing
findIdentifier content pos =
  if pos < (1, 1)
  then error "Bad cursor position"
  else do
    hsModule <- fromParseResult $ parseModule content
    getIdentifierForPos hsModule pos


-- helper functions

fromParseResult(ParseOk hm) = Just hm
fromParseResult _ = Nothing

getIdentifierForPos :: HsModule -> (Int, Int) -> Maybe String
getIdentifierForPos hsModule pos = do
  let occs = sort $ colloectOccurences hsModule
  occ <- find occs pos
  fromOcc occ pos

collectOccurrences :: HsModule -> [(SrcLoc, String)]
collectOccurrences = everthing (++) ([], `mkQ` getOcc) where
  getOcc (HsIdent loc str) = [(loc, str)]

find :: [(SrcLoc, String)] -> (Int, Int) -> Maybe (SrcLoc, String)
find []   _   = Nothing
find locs pos = getLast$ locsBefore locs pos where
  getLast [] = Nothing
  getLast locs = Just $ last locs

locsBefore locs pos = filter (before pos) locs where
  before :: (Int, Int) -> (SrcLoc, String) -> Bool
  before (posL, posC) ( (SrcLoc _ line col), _ ) = 
    line < posL || ( line == posL && col <= posC )

-- we have the first identifier before the specified position, but still the
-- end of the identifier must be after the specified position (else the cursor
-- would in fact be after the identifier that we have found) 
fromOcc :: (SrcLoc, String) -> (Int, Int) -> Maybe String
fromOcc ((SrcLoc _ line col), ident) (posL, posC) = do
  if line /= posL || ( col + length ident ) < posC 
    then Nothing
    else Just ident
