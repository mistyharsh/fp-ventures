
-- To the power operation
xx = 2 ^ 6

-- -- Booleans
bool = True && False

-- List operations
xs = [1, 2, 3, 4, 5, 6, 7, 8, 9]

concatedList = xs ++ [10, 11, 12]

frontAdded = 0 : xs

headItem = head xs
tailItem = tail xs

-- Even if this is error, it will not because of lazy evaluation
tailItem2 = tail []

take2 = take 2 xs
drop3 = drop 3 xs

-- Tuple
tup = (True, "Hello")

-- fst and snd only works on 2 point tuple
firstTup = fst tup
lastTup = snd tup