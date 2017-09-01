
-- Creating a simple function
{-
    square is a function name. It accepts x as argument
-}
square :: Integer -> Integer
square x = x * x

-- Pattern matching
-- myNot :: Bool -> Bool
myNot True = False
myNot False = True

-- In case of pattern matching, input value cannot have value constructor that belongs to different type.