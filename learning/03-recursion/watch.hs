-- This program fires alarm SHARKNADO when it is 7 o'clock

watch :: Int -> [Char]
watch time = if time == 7
             then "7 o'clock and ... SHARKNADO!"
             else show time ++ " o'clock and all's well."

-- Using pattern matching
watch2 :: Int -> [Char]
watch2 7 = "7 o'clock and ... SHARKNADO!"
watch2 time = show time ++ " o'clock and all's well."

-- Using where expression
-- This reduces bit redundancy. Choice is yours.
-- Pick the one which is more conscise and readable
watch3 :: Int -> [Char]
watch3 n = show n ++ "o'clock and " ++ message n
           where message 7 = "... SHARKNADO"
                 message _ = "all's well."

-- Using case expression
watch4 :: Int -> [Char]
watch4 n = show n ++ "o'clock and " ++
            case n of 7 -> "... SHARKNADO"
                      _ -> "all's well."
