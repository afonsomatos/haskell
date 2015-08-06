largest :: Integer -> Integer
largest n
    | p == n    = p
    | otherwise = largest (n `div` p)
    where p = nearestPrime n

nearestPrime :: Integer -> Integer
nearestPrime n = head [k | k <- [2..n], n `mod` k == 0]

main = print $ largest 600851475143