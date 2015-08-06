import Data.Char (digitToInt)

factDigitSum :: Integer -> Int
factDigitSum n = sum . map digitToInt . show . product $ [1..n]