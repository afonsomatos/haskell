fibs :: [Integer]
fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

findSum = sum .
          filter even .
          takeWhile (<= 40 ^ 6) $ fibs

main = print findSum