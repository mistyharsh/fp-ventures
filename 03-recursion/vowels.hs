-- This examples takes a string, removes all the non vowels and returns a string that contains only vowels

vowels :: [Char] -> [Char]
vowels str = if str == ""
               then ""
               else if elem (head str) "aeiouAEIOU"
                    then head str : vowels (tail str)
                    else vowels(tail str)

-- Using pattern matching
vowels2 :: [Char] -> [Char]
vowels2 [] = ""
vowels2 (x:xs) = if x `elem` "aeiouAEIOU"
                   then x : vowels xs
                   else vowels xs

-- Using pattern matching along with guards
vowels3 :: [Char] -> [Char]
vowels3 [] = ""
vowels3 (x:xs) | x `elem` "aeiouAEIOU" = x : vowels3 xs
vowels3 (x:xs) = vowels3 xs

-- Using pattern matching along with Better Guards
vowels4 :: [Char] -> [Char]
vowels4 "" = ""
vowels4 (x:xs)
        | x `elem` "aeiouAEIOU" = x : vowels4 xs
        | otherwise = vowels4 xs
