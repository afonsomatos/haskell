import Data.List (sortBy)

-- 1.
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- 2.
myLength' :: [a] -> Int
myLength' [] = 0
myLength' (x:xs) = 1 + myLength xs

-- 3.
mean :: [Int] -> Double
mean xs = let s = fromIntegral $ sum xs
              l = fromIntegral $ length xs
          in s / l

-- 4.
palindrome :: [a] -> [a]
palindrome xs = xs ++ reverse xs

-- 5.
isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = xs == reverse xs

-- 6.
sortXss :: [[a]] -> [[a]]
sortXss xss = sortBy step xss
    where step a b = length a `compare` length b

-- 7.
intersperse :: a -> [[a]] -> [a]
intersperse _ []       = []
intersperse s (xs:xss) = xs ++ concatMap (s:) xss

-- 8.
data Tree a = Node a (Tree a) (Tree a)
            | Empty
            deriving (Show)

treeHeight :: Tree a -> Int
treeHeight Empty = 0
treeHeight (Node x l r) = 1 + max (treeHeight l) (treeHeight r)

-- 9.
data Direction = LeftTurn | RightTurn | Straight

-- 10.
data Point = Point Int Int deriving (Show)

direction :: Point -> Point -> Point -> Direction
direction p1 p2 p3
    | cross p1 p2 p3 < 0 = RightTurn
    | cross p1 p2 p3 > 0 = LeftTurn
    | otherwise = Straight
    where cross (Point x1 y1) (Point x2 y2) (Point x3 y3) =
            (x2 - x1) * (y3 - y1) - (y2 - y1) * (x3 - x1)

-- 11.
tripleDirection :: [Point] -> [Direction]
tripleDirection (a:b:c:xs) = direction a b c : tripleDirection xs
tripleDirection _          = []

-- 12.