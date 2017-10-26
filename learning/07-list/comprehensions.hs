-- Multiplication table upto 20

multTable :: [[Int]]
multTable = [ [x * y | y <- [1..10]] | x <- [1..20] ]