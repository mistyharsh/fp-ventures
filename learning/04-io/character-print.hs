
import Control.Monad

-- This will behave differently in GHC and GHCi
main :: IO ()
main = do
    c <- getChar
    if c /= ' '
        then (do
            putChar c
            main
        )
        else return ()

-- The important thing to note is that `do` block
-- glues together two or more I/O action into one
main2 :: IO ()
main2 = do
    c <- getChar
    when (c /= ' ') $ do
        putChar c
        main

-- Two functions main and main2 are equivalent