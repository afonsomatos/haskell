chain :: Integer -> Integer
chain 0 = 0
chain 1 = 1
chain n = 1 + chain (if even n then n `div` 2 else 3 * n + 1)

indexMax :: Integer -> Integer -> Integer -> [Integer] -> Integer
indexMax _ m _ []     = m
indexMax i m v (x:xs)
    | x > v     = indexMax (i + 1) i x xs
    | otherwise = indexMax (i + 1) m v xs

main = print . indexMax 0 0 0 . map chain $ [0..10^6]