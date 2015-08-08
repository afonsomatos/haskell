import Data.Char (digitToInt)
import Data.List (foldl')

-- 1.
asInt_fold :: String -> Int
asInt_fold ""       = error "Empty input"
asInt_fold ['-']    = error "Missing negative number"
asInt_fold ('-':xs) = negate (asInt_fold xs)
asInt_fold xs       = foldl' step 0 xs where
    step acc x
        | acc < 0            = error "Int too big"
        | x < '0' || x > 'f' = error $ "Not a digit: " ++ [x]
        | otherwise          = acc * 10 + digitToInt x

-- 2.
type ErrorMessage = String

asInt_either :: String -> Either ErrorMessage Int
asInt_either ""       = Left "Empty input"
asInt_either ['-']    = Left "Missing negative number"
asInt_either ('-':xs) = fmap negate (asInt_either xs)
asInt_either xs       = foldl' step (Right 0) xs where
    step (Right acc) x
        | acc < 0            = Left "Int too big"
        | x < '0' || x > 'f' = Left  $ "Not a digit: " ++ [x]
        | otherwise          = Right $ acc * 10 + digitToInt x
    step errorMsg   _ = errorMsg

-- 3.
concat' :: [[a]] -> [a]
concat' = foldr (++) []

-- 4.
takeWhile_recursive :: (a -> Bool) -> [a] -> [a]
takeWhile_recursive _ []     = []
takeWhile_recursive f (x:xs)
    | f x       = x : takeWhile_recursive f xs
    | otherwise = []

-- 5.
groupBy_fold :: (a -> a -> Bool) -> [a] -> [[a]]
groupBy_fold _ []     = []
groupBy_fold f xs     = foldr step [[(last xs)]] (init xs) where

    step x (y:ys) = if f x (head y)
                        then (x : y) : ys
                        else [x] : y : ys

-- 6.
any' :: (a -> Bool) -> [a] -> Bool
any' f = foldr step False where

    step _ True  = True
    step x False = f x   

cycle' :: [a] -> [a]
cycle' xs = foldr (:) (cycle' xs) xs

words' :: String -> [String]
words' = filter (not . null) . foldr step [] where

    step x a@(w:ws)
        | x == ' '  = [] : a
        | otherwise = (x : w) : ws
    step x [] = [[x]]

unlines' :: [String] -> String
unlines' = foldl' (\acc x -> acc ++ x ++ "\n") []