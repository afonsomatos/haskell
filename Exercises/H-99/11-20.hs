-- Problem 11
data ListItem a = Single a | Multiple Int a
    deriving Show

encodeModified :: Eq a => [a] -> [ListItem a]
encodeModified = map step . pack 

    where step [x]     = Single x
          step l@(x:_) = Multiple (length l) x

-- Problem 12
decodeModified :: [ListItem a] -> [a]
decodeModified = concatMap step

    where step (Single x)     = [x]
          step (Multiple n x) = replicate n x

-- Problem 13
encodeDirect :: Eq a => [a] -> [ListItem a]
encodeDirect []     = []
encodeDirect (x:xs) = item x : encodeDirect o
    
    where (m, o) = span (==x) xs
          len    = length m + 1
          item   = if len > 1
                        then Multiple len
                        else Single

-- Problem 14
dupli :: [a] -> [a]
dupli = (>>= replicate 2)

-- Problem 15
repli :: [a] -> Int -> [a]
repli xs n = xs >>= replicate n

-- Problem 16
dropEvery :: [a] -> Int -> [a]
dropEvery xs n
    | length xs < n = xs
    | otherwise     = take (n - 1) xs ++ dropEvery (drop n xs) n

-- Problem 17
split :: [a] -> Int -> ([a], [a])
split = flip splitAt

-- Problem 18
slice :: [a] -> Int -> Int -> [a]
slice xs x y = let len = length xs
                
               in take (y - x + 1) . drop (x - 1) $ xs

-- Problem 19
rotate :: [a] -> Int -> [a]
rotate xs n = drop q xs ++ take q xs
    where q = if n < 0 then length xs + n else n

-- Problem 20
removeAt :: Int -> [a] -> (a, [a])
removeAt n xs = let x = xs !! (n - 1)
                    y = take (n - 1) xs ++ drop n xs  
                in (x, y)

-- Ignore: Helper functions from previous exercises
pack :: Eq a => [a] -> [[a]]
pack [] = []
pack a@(x:_) = let (s, d) = span (==x) a
               in s : pack d