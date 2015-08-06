sumOfSquares :: Integer
sumOfSquares = sum $ map (^2) [1..100]

squareSum :: Integer
squareSum = (^2) $ sum [1..100]

diff :: Integer
diff = squareSum - sumOfSquares

main = print diff