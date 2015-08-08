import System.Environment (getArgs)
import Data.List (transpose)

-- 1.
safeHead :: [a] -> Maybe a
safeHead []    = Nothing
safeHead (x:_) = Just x

safeTail :: [a] -> Maybe [a]
safeTail []     = Nothing
safeTail (_:xs) = Just xs

safeLast :: [a] -> Maybe a
safeLast []     = Nothing
safeLast [x]    = Just x
safeLast (x:xs) = safeLast xs

safeInit :: [a] -> Maybe [a]
safeInit []     = Nothing
safeInit [x]    = Just []
safeInit (x:xs) = fmap (x:) $ safeInit xs

-- 2.
splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _ [] = [[]]
splitWith f xs = let (h, l) = span f xs
                 in if null l then [h] else h : (splitWith f $ tail l)

-- 3.
interactWith function inputFile outputFile = do
    input <- readFile inputFile
    writeFile outputFile (function input)

main = mainWith myFunction
    where mainWith function = do
            args <- getArgs
            case args of
                [input, output] -> interactWith function input output
                _               -> putStrLn "error: exactly two arguments needed"

          myFunction = unlines . map (head . words) . lines

-- 4.
transpose' :: String -> String
transpose' = unlines . transpose . lines