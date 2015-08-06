1.

False :: Bool

(["foo", "bar"], 'a') :: ([[Char]], Char)

[(True, []), (False, [['a']])] :: [(Bool, [[Char]])]


----------------------------------------------------

1. Return any element from the list

2. 

> lastButOne :: [a] -> a
> lastButOne xs = last (init xs)

3. It throws an error.