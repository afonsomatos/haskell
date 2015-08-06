smallest :: Integer
smallest = foldr1 lcm [2..20]

main = print smallest