import Data.List (tails)

-- Problem 21
insertAt :: a -> [a] -> Int -> [a]
insertAt x xs n = let (f, s) = splitAt (n - 1) xs in f ++ x : s

-- Problem 22
range :: Int -> Int -> [Int]
range = enumFromTo

-- TODO: Problem 23
-- TODO: Problem 24
-- TODO: Problem 25

-- Problem 26
combinations :: Int -> [a] -> [[a]]
combinations 0 _  = [[]]
combinations n xs = [ y:ys | y:xs' <- tails xs, ys <- combinations (n - 1) xs' ]

-- Problem 27
