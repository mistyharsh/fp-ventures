-- Simple IO () illustrations

-- This function takes a string and returns an action that produces unit () value
sayHello :: String -> IO ()
sayHello x = putStrLn ("Hello " ++ x ++ "!")


-- Notice the use of $ here. It is reducing parenthesis
sayHello2 :: String -> IO()
sayHello2 x = putStrLn $ "Hello " ++ x ++ "!"