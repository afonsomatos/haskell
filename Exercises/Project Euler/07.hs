primes :: [Integer]
primes = sieve [2..]
    where sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p > 0]

prime10001 :: Integer
prime10001 = primes !! 10000

main = print prime10001