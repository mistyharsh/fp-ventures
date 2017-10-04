-- Custom enum implementation

myEnumTo :: (Enum a, Ord a) => a -> a -> [a]
myEnumTo x y
        | x <= y = x : myEnumTo (succ x) y
        | otherwise = []