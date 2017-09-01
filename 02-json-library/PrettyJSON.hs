module PrettyJSON (
    renderJValue
) where

import Numeric (showHex)
import Data.Char (ord)
import Data.Bits (shiftR, (.&.))

import SimpleJSON (JValue(..))
import PrettyStub (Doc, (<>), char, double, fsep, hcat, punctuate, text, compact, pretty)

renderJValue :: JValue -> Doc
renderJValue (JBool True) = text "true"
renderJValue (JBool False) = text "false"
renderJValue JNull = text "null"
renderJValue (JNumber num) = double num
renderJValue (JString str) = string str
renderJValue (JArray ary) = series '[' ']' renderJValue ary
renderJValue (JObject obj) = series '{' '}' field obj
    where field (name,val) = string name <> text ": " <> renderJValue val

-- Converts String to Doc
string :: String -> Doc
string = enclose '"' '"' . hcat . map oneChar

-- Wrap a Doc value with opening and closing character
-- Here is is wrapping like "Doc"
enclose :: Chart -> Char -> Doc -> Doc
enclose left right x = (char left) <> x <> (char right)

-- Doc equivalent for List contact
hcat :: [Doc] -> Doc
hcat xs = undefined

-- Our string function applies the oneChar function to every character in a string, concatenates the lot, and encloses the result in quotes.
-- The oneChar function escapes or renders an individual character.
oneChar :: Char -> Doc
oneChar c = case lookup c simpleEscape of
                Just r -> text r
                Nothing | mustEscape c -> hexEscape c
                        | otherwise    -> char c
    where mustEscape c = c < ' ' || c == '\x7f' || c > '\xff'

simpleEscapes :: [(Char, String)]
simpleEscapes = zipWith ch "\b\n\f\r\t\\\"/" "bnfrt\\\"/"
    where ch a b = (a, ['\\',b])

-- Turning a character into the string “\u” followed by a four-character sequence of hexadecimal digits
-- representing the numeric value of the Unicode character.
smallHex :: Int -> Doc
smallHex x  = text "\\u"
           <> text (replicate (4 - length h) '0')
           <> text h
    where h = showHex x ""

astral :: Int -> Doc
astral n = smallHex (a + 0xd800) <> smallHex (b + 0xdc00)
    where a = (n `shiftR` 10) .&. 0x3ff
          b = n .&. 0x3ff

series :: Char -> Char -> (a -> Doc) -> [a] -> Doc
series open close item = enclose open close . fsep . punctuate (char ',') . map item