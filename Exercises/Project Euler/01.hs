import Data.List

findSum :: Integer
findSum = sum . nub $ [3,6..999] ++ [5,10..999]

main = print findSum