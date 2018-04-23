
-- Find maximum from the list
-- Not so optimized solution
maxList :: [Integer] -> Integer
maxList [] = error "Empty list not allowed"
maxList [x] = x
maxList (x:xs) = whichIsGreater x xs
    where whichIsGreater x [] = x
          whichIsGreater x (y:ys) = whichIsGreater (max x y) ys

-- This is another variation of the same concept.
-- This is better and more conscise
maxList2 :: (Ord a) => [a] -> a
maxList2 [] = error "You cannot ask maximum of empty list"
maxList2 [x] = x
maxList2 (x:xs)
            | x > mx = x
            | otherwise = mx
            where mx = maxList2 xs