module TypeClass where

-- Values to right are greater than values to left
data DayOfWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving (Ord)

-- Define `Eq` == for DayOfWeek type
instance Eq DayOfWeek where
    (==) Mon Mon = True
    (==) Tue Tue = True
    (==) Wed Wed = True
    (==) Thu Thu = True
    (==) Fri Fri = True
    (==) Sat Sat = True
    Sun == Sun = True     -- Using infix notation
    (==) _ _ = False        -- Using general case

-- When you have polymorphic type be careful
data Identity a = Identity a

instance Eq a => Eq (Identity a) where
    (==) (Identity v) (Identity v') = v == v'

-- Excercises from page 235
data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
    (==) (TisAn a) (TisAn a') = a == a'

data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
    (Two a b) == (Two a' b') = a == a' && b == b'

data StringOrInt = TisAnInt Int | TisAnString String

instance Eq StringOrInt where
    (==) (TisAnInt a) (TisAnInt a') = a == a'
    (==) (TisAnString s) (TisAnString s') = s == s'
    (==) _ _ = False


data Pair a = Pair a a
data PairNoEq = PairNoEq

-- Here, if I don't add constraint Eq a => then it won't compile
-- Compiler needs that your parametric type `a` will implement Eq
instance Eq a => Eq (Pair a) where
    (==) (Pair b b') (Pair c c') = b == c && c == c'


data Tuple a b = Tuple a b

-- When running this code would be
-- (Tuple 10, 20) == Tuple (10, 20)
-- Not `Tuple (10, 20) == Tuple (10, 20)`. This means I am creating a pair and passing it to Tuple.
instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==) (Tuple x y) (Tuple x' y') = x == x' && y == y'

data Which a = ThisOne a | ThatOne a

instance Eq a => Eq (Which a) where
    (==) (ThatOne a) (ThatOne a') = a == a'
    (==) (ThisOne a) (ThisOne a') = a == a'
    (==) _ _ = False    -- Don't care about any other combination

-- This will not work. TODO: I am confused. Why this will not work.
-- i :: a
i :: Num a => a
i = 10

testCustom :: a -> a
testCustom x = x

-- This will not work. TODO: Also not sure, why this will not work.
-- f :: Num a => a

-- This will work
-- f :: Float
-- f :: Fractional a => a
f :: RealFrac a => a
f = 1.0