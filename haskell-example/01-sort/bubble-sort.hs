-- Bubble sort using recursin

-- Pattern match list with exactly two items
-- bubbleSort [x, y] = [x, y]

-- This bubble sort is still trickier to handle
bubbleSort :: [Integer] -> [Integer]
bubbleSort [] = []
bubbleSort [x] = [x]
bubbleSort xs = (bubbleSort $ init list') ++ [last list']
    where
        list' = go xs
        go [] = []
        go [x] = [x]
        go (x:y:xs)
            | x <= y = x : go (y:xs)
            | otherwise = y : go (x:xs)

-- Can this be done in better way