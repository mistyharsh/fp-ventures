awesome = ["Papuchon", "Curry", "Haskell"]
alsoAwesome = ["Quake", "The simons"]
allAwesome = [awesome, alsoAwesome]

-- This is can possible get confusing
getAllAwesomeLength :: Int
getAllAwesomeLength = length $ concat allAwesome

-- This is working without any explicit parenthesis due to operator associativity and precedence
-- Learn the rules when you need parenthesis
getSomeLength :: Int
getSomeLength = length allAwesome + length allAwesome

-- Reverse the string.
myReverse :: String -> String
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

-- TODO: Palindrome using recursion

-- Absoute number
-- Can also be written using guard
getAbsolute :: Integer -> Integer
getAbsolute a = if a < 0
                then a * (-1)
                else a

-- Test type in GHCi for this function
jackal :: (Ord a, Eq b) => a -> b -> a
jackal a b = a

-- 'where' statement is as good as writing haskell expression in local state.
-- What you can do without 'where' is the same thing you can do without 'where'
-- It is just introducing another scope

triple x = tripleItYo x
    where tripleItYo :: Integer -> Integer
          tripleItYo y = y * 3

-- From page 191, how can I solve?
-- munge :: (x -> y) -> (y -> (w, z)) -> x -> w
munge f1 f2 x =  fst $ f2 $ f1 x