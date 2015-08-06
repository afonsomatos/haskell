module Hologram where

import Data.List (sort, (\\), nub)

histogram :: String -> String -> [String]
histogram _ []   = []
histogram lst xs = map char lst : histogram lst (xs \\ sort (nub xs))

    where char x = if x `elem` xs
                       then '*'
                       else ' '
main = do

    putStr "Possible characters: "
    lst <- getLine

    putStr "Input characters: "
    xs <- getLine

    putStr . unlines
           . reverse
           . (++) [lst, replicate (length lst) '=']
           $ histogram lst xs