-- This program provides custom implementation of length, sum, product, maximum

length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

product' :: (Num a) => [a] -> a
product' [] = 1
product' (x:xs) = x + product' xs

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "You cannot ask maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
            | x > mx = x
            | otherwise = mx
            where mx = maximum' xs

-- Higher order map custom implementation
map' :: (a -> a) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs
