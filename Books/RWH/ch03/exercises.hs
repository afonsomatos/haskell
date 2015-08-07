-- 1.
data List a = Cons a (List a)
            | Nil
            deriving (Show)

fromList :: List a -> [a]
fromList Nil = []
fromList (Cons x xs) = x : fromList xs

-- 2.
data Tree a = Node a (Maybe (Tree a)) (Maybe (Tree a)) deriving (Show)