-- Program to calculate integral division function

type Numerator = Integer
type Denominator = Integer
type Quotient = Integer

-- Simple recursive function to calculate Quotient. No reminder
division :: Numerator -> Denominator -> Quotient
division _ 0 = error "dont bother me"
division 0 _ = 0
division a b
        | a < b = 0
        | otherwise = 1 + division (a - b) b

-- Another variation which returns (Quotient, Reminder)
-- `go` is a popular convention/ idiom in Haskell for tail-recursive worker loops
division2 :: Numerator -> Denominator -> (Integer, Integer)
division2 num denom = go num denom 0
    where go n' d' q'
            | n' < d' = (q', n')
            | otherwise = go (n' - d') d' (q' + 1)