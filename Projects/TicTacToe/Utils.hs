module Data.List.Utils where 

import Data.List (intersperse)

isInt :: String -> Bool
isInt s = case reads s :: [(Int, String)] of

    [(_, "")] -> True
    _         -> False

surround :: a -> [a] -> [a]
surround x ys = x : intersperse x ys ++ [x]

nth :: Int -> (a -> a) -> [a] -> [a]
nth _ _ [] = []
nth 0 f (x:xs) = f x : xs
nth n f (x:xs) = x : nth (n - 1) f xs