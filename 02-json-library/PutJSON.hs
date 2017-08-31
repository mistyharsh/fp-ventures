module PutJSON where

import Data.List (intercalate)
import SimpleJSON

renderJValue :: JValue -> String

-- rendering simple JSON data
renderJValue (JString s) = show s
renderJValue (JNumber n) = show n
renderJValue (JBool True) = "true"
renderJValue (JBool False) = "false"
renderJValue JNull = "null"

renderJValue (JObject o) = "{" ++ pairs o ++ "}"
    where pairs [] = ""
          pairs ps = intercalate ", " (map renderPair ps)
          renderPair (k, v) = show k ++ ": " ++ renderJValue v

renderJValue (JArray a) = "[" ++ values a ++ "]"
    where values [] = ""
          values vs = intercalate ", " (map renderJValue vs)


-- It is core idea to separate pure code from the code that performs I/O
putJValue :: JValue -> IO ()
putJValue v = putStrLn (renderJValue v)

-- Running sample code
-- renderJValue (JArray [JNumber 1, JNumber 2])
-- putJValue  (JArray [JNumber 1, JNumber 2])