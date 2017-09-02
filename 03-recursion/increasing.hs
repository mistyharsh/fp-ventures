-- Find if list is in increasing order or not

-- Here the Fat arrow => means such that

-- Generic recusion example
-- increasing :: (Ord a) => [a] => Bool
increasing xs = if xs == []
                then True
                else if tail xs == []
                     then True
                     else if head xs <= head (tail xs)
                          then increasing (tail xs)
                          else False

-- Using pattern matching
increasing2 [] = True
increasing2 [x] = True
increasing2 (x:y:xs) = x <= y && increasing2(y:xs)
-- How I wrote originally
-- increasing2 (x:y:xs) = if x <= y then increasing2 (y:xs) else False