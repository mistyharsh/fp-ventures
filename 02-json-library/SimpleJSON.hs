module SimpleJSON (
  JValue(..),      -- Export Type Constructor JValue along with all Data Constructors
  getString,
  getInt,
  getDouble,
  getBool,
  getObject,
  getArray,
  isNull
) where

data JValue = JString String
            | JNumber Double
            | JBool Bool
            | JNull
            | JObject [(String, JValue)]
            | JArray [JValue]
              deriving (Eq, Ord, Show)

-- Get JSON String
getString :: JValue   ->  Maybe String
getString (JString s) =   Just s
getString _           =   Nothing

-- Get Integer
getInt :: JValue    ->  Maybe Int
getInt (JNumber n)  =   Just (truncate n)
getInt _            =   Nothing

-- Get Double
getDouble :: JValue   ->  Maybe Double
getDouble (JNumber n) =   Just n
getDouble _           =   Nothing

-- Get Boolean
getBool :: JValue ->  Maybe Bool
getBool (JBool b) =   Just b
getBool _         =   Nothing

-- Get Object
-- Not sure what will be the type signature
-- getObject :: JValue   ->  Maybe JObject
getObject (JObject o) =   Just o
getObject _           =   Nothing

-- Get JSON Array
-- getArray :: JValue  ->  Maybe JValue
getArray (JArray a) =   Just a
getArray _          =   Nothing

-- Check if value is null
isNull :: JValue  -> Bool
isNull v  = v == JNull