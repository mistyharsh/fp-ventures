
-- Selection sort
selectionSort :: [Integer] -> [Integer]
selectionSort [] = []
selectionSort [x] = [x]
selectionSort (x:xs) = [x]

-- Find minimum from list
minList :: [Integer] -> Integer
minList [] = error "Cannot find minimum"
minList [x] = x
minList (x:xs)
    | x < minx = x
    | otherwise = minx
    where minx = minList xs