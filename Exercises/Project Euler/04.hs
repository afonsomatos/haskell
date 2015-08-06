isPalindrome :: Integer -> Bool
isPalindrome n = (show n) == (reverse . show $ n)

largestPalindrome :: Integer
largestPalindrome = maximum . filter isPalindrome $ products
    where products = [x * y | x <- [100..999], y <- [x..999]]

main = print largestPalindrome