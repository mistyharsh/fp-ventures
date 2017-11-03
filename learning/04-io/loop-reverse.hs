
main :: IO ()
main = do
    line <- getLine
    if null line
        then return ()  -- return () means an IO action. () wrapped inside IO action
        else (
            do
            putStrLn $ reverseWords line
            main
        )

reverseWords :: String -> String
reverseWords = unwords . map reverse . words

-- returns statement only wraps the value in box/context
main2 = do
    a <- return "Hello"
    b <- return "Harshal"
    putStrLn $ a ++ " " ++ b ++ "!"