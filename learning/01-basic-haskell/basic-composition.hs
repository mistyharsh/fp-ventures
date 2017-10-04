-- Using composition effectively

sumAndNegate1 = negate . sum $ [1, 2, 3, 4, 5]

-- Equivalent of
sumAndNegate2 = (negate . sum) [1, 2, 3, 4, 5]

-- If we do this, then we are doing it wrong
-- It would evaluate like negate . 15
-- sum has higher precedence (10) than . (9)
sumAndNegateFaulty = negate . sum [1, 2, 3]

-- Another example
-- Refactor to use composition
makeListOfFive x = take 5 (enumFrom x)

-- After refactoring
makeListOfFive2 x = take 5 . enumFrom $ x

-- Here we use $ (0) because it has lower precedence than . (10).
-- If we don't do this we end with error
makeListOfFiveFault x = take 5 . enumFrom x
-- It reduces to `take 5 . enumFrom 3`

-- Another example of using $
inc :: Num a => a -> a
inc = (+1)

incThree1 = inc . inc . inc $ 0
incThree2 = (inc . inc . inc) 0