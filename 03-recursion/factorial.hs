-- Calcuate factorial of a number using recursion

factorial :: Integer -> Integer
factorial 1 = 1
factorial n
    | n > 0 = n * factorial (n -1)  -- Remember to put whitespace before `(`
    | otherwise = 0
