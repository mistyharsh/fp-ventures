-- Defining an Algebraic Data Type

-- Fields are positional Int is bookId, String is book name, [String] is Authors list
data BookInfo = Book Int String [String]
                deriving (Show)

-- Using whitespace syntax
book1 = Book 1 "Harshal" ["HP", "KD"]


-- Creating type synonym
type BookId = Integer
type BookName = String

data BookInfo2 = BookInfo2 BookId BookName [String]

book2 = BookInfo2 1 "Harshal" ["HP", "CP"]

-- Multiple value constructor
data MyBool = True | False deriving Show

type CardNumber = Integer
type CardHolder = String
type Address = String
type CustomerId = Integer

data BillingInfo = CreditCard CardNumber CardHolder Address
                    | CashOnDelivery
                    | Invoice CustomerId
                    deriving (Show)

-- Pattern matching with exhaustive list
goodList :: [Integer] -> (Integer)
goodList (x:xs) = x + goodList xs
goodList _ = 0

-- Using pattern matching to act like an accessor
bookId (Book id title authors) = id
betterBookTitle (Book _ title _) = title

-- Record syntax to avoid boilerplate
data Customer = Customer {
    customerId :: CustomerId,
    customerName :: String,
    address:: String
} deriving (Show)

customer1 = Customer 1 "HP" "Pune"
customer2 = Customer {
    customerId = 2,
    address = "Jalgaon",
    customerName = "KD"
}

-- Parameterised types
data MyMaybe a = MyJust a | MyNothing deriving Show

-- Let expression and where clause
lend1 amount balance =  let reserve = 100
                            newBalance = balance - amount
                        in  if balance < reserve then MyNothing else MyJust newBalance

lend2 amount balance =  if balance < reserve then MyNothing else MyJust newBalance
                        where   reserve = 100
                                newBalance = balance - amount

-- To further simplify readability, we can use guards
lend3 amount balance
    | amount <= 0       = MyNothing
    | amount > reserve  = MyNothing
    | otherwise         = MyJust newBalance
    where   reserve     = 100
            newBalance  = balance - amount

-- Example of as pattern
getFirstItem all@ (x:xs) = "The first item in " ++ all ++ " is " + x