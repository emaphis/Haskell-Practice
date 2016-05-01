-- | HUnit expriments
--   tutoralial located at: <https://leiffrenzel.de/papers/getting-started-with-hunit.html>

module FindIdentifier_Test where

import FindIdentifier (findIdentifier)
import Test.HUnit

borderCases =  TestLabel "Border test cases" (TestList [ testEmpty, testNegCursor, testComment ])


testEmpty = TestCase $ assertEqual 
  "Should get Nothing from an empty string" Nothing ( findIdentifier "" (1, 1) )
testNegCursor = TestCase $ assertEqual
  "Should get Nothing whe cursor is negative" Nothing (findIdentifier "a" (-1,-1))
testComment = TestCase $ assertEqual
  "Should get Nothing on Comment" Nothing (findIdentifier "-- a" (1, 3))


simpleCases = TestLabel "Simple, but serious cases" (TestList [ testMinimal, testData ])

testMinimal = TestCase $ assertEqual
  "Minimal program" (Just "main") (findIdentifier "main = print 42" (1,2))

testData = TestCase $ assertEqual
  "Data declarations"
  (Just "Bli")
  (findIdentifier "main = print 42\ndata Bli | Blubb" (2,7))

main = runTestTT $ TestList [ borderCases, simpleCases ]
