import Data.Char

powerSum :: String -> Int
powerSum = sum . map digitToInt

main = print . powerSum . show $ (2 ^ 1000)