module PrettyStub where

import SimpleJSON

data Doc = ToBeDefined
           deriving (Show)

string :: String -> Doc
string str = undefined

text :: String -> Doc
text str = undefined

double :: Double-> Doc
double num = undefined

-- Doc equivalent for String append
(<>) :: Doc -> Doc -> Doc
a <> b = undefined

-- Converts Character to Doc
char :: Char -> Doc
char c = undefined

fsep :: [Doc] -> Doc
fsep xs = undefined