-- JavaScript promise.all()
-- `sequence` takes a list of I/O actions and returns an I/O actions
-- that will perform those actions one after the other.
-- The result contained in that I/O action will be a list of the results of all the I/O actions
-- that were performed.
-- Its type signature is sequence :: [IO a] -> IO [a]

main = do
    a <- getLine
    b <- getLine
    c <- getLine
    print [a, b, c]

-- Above function is equivalent to
main2 = do
    rs <- sequence[getLine, getLine, getLine]
    print rs

--  Above function is equivalent to
main3 = do
    let action = getLine
    rs <- sequence[action, action, action]
    print rs

-- A common pattern with sequence is when we map functions like print or putStrLn over lists.
-- Doing map print [1,2,3,4] won't create an I/O action.
-- It will create a list of I/O actions

-- Note: Following function will print 1 2 3 [(), (), ()]
-- Reason is that `sequence` function will provide result as list
seq1 = sequence (map print [1, 2, 3])

-- Because mapping a function that returns an I/O action over a list
-- and then sequencing it is so common, the utility functions mapM and mapM_ were introduced.
-- mapM takes a function and a list, maps the function over the list and then sequences it.
-- mapM_ does the same as mapM, only it throws away the result later.