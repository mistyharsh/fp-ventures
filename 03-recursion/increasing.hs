-- Find if list is in increasing order or not

-- Here the Fat arrow => means such that

-- Generic recusion example
increasing :: (Ord a) => [a] -> Bool
increasing xs = if xs == []
                then True
                else if tail xs == []
                     then True
                     else if head xs <= head (tail xs)
                          then increasing (tail xs)
                          else False

-- Using pattern matching
-- Pattern matching can reduce the nesting of if-else structure.
-- It makes function more readable and easy to follow

increasing2 [] = True       -- Matches empty list
increasing2 [x] = True      -- Matches list with one item. Similarly, increasing2 [x, y] = False matches list with length 2.
increasing2 (x:y:xs) = x <= y && increasing2(y:xs)
-- How I wrote originally
-- increasing2 (x:y:xs) = if x <= y then increasing2 (y:xs) else False