s :: Integer
s = 1000

findTriplet :: Integer
findTriplet = head [a * b * c | a <- [1..], b <- [a..s], let c = (s - a - b), a ^ 2 + b ^ 2 == c ^ 2]

main = print findTriplet