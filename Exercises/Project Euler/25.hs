fibs :: [Integer]
fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

termLength :: Int -> [Integer] -> Integer
termLength n (x:xs)
    | len == n  = 1
    | otherwise = 1 + termLength n xs
    where len = length (show x)

main = print $ 100000 `termLength` fibs