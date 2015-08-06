-- Problem 1
myLast :: [a] -> Maybe a
myLast []  = Nothing
myLast [x] = Just x
myLast (_:xs) = myLast xs

-- Problem 2
myButLast :: [a] -> Maybe a
myButLast []     = Nothing
myButLast [x, y] = Just x
myButLast (x:xs) = myButLast xs

-- Problem 3
elementAt :: [a] -> Int -> Maybe a
elementAt [] _   = Nothing
elementAt (x:xs) 1 = Just x
elementAt (_:xs) n = elementAt xs (n - 1)

-- Problem 4
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- Problem 5
myReverse :: [a] -> [a]
myReverse [] = []
myReverse xs = last xs : myReverse (init xs)

-- Problem 6
isPalindrome :: Eq a => [a] -> Bool
isPalindrome []     = True
isPalindrome [x]    = True
isPalindrome (x:xs) = (x == last xs) && (isPalindrome $ init xs)

-- Problem 7
data NestedList a = Elem a | List [NestedList a]
    deriving Show

flatten :: NestedList a -> [a]
flatten (Elem x) = [x]
flatten (List []) = []
flatten (List (x:xs)) = flatten x ++ flatten (List xs)

-- Problem 8
compress :: Eq a => [a] -> [a]
compress (x:ys@(y:_))
    | x == y    = compress ys
    | otherwise = x : compress ys
compress ys = ys

-- Problem 9
pack :: Eq a => [a] -> [[a]]
pack [] = []
pack a@(x:_) = let (s, d) = span (==x) a
               in s : pack d

-- Problem 10
encode :: Eq a => [a] -> [(Int, a)]
encode = map step . pack
    
    where step a@(x:_) = (length a, x)