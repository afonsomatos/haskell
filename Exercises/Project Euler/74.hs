import Data.Char (digitToInt)

factorial :: Int -> Int
factorial n = product [1..n] 

sumDigitsFact :: Int -> Int
sumDigitsFact = sum . map (factorial . digitToInt) . show

chainLen :: Int -> Int
chainLen = length . loop []

    where loop xs x
            | x `elem` xs = xs
            | otherwise   = loop (x : xs) $ sumDigitsFact x

findNums :: Int -> Int -> Int
findNums n lim = length . filter (==n) . map chainLen $ [1..lim]

main :: IO ()
main = print $ findNums 60 (10 ^ 6)