## Anonymous function
They are basically lambdas. Example:
```haskell
let triple = (\x -> x * 3) :: Integer -> Integer
```

## Pattern matching
Pattern matching is **deconstruction** of value as opposed to **data constructors**. Patterns are matched against values, or data constructors, not types. Pattern matching proceeds from left to right and outside to inside. When a match succeeds, the variable exposed in the pattern are bound.

To create block like function/multiline function in **GHCi**:
```haskell
Prelude> :{
    let isItTwo :: Integer -> Integer
        isItTwo 2 = True
        isItTwo _ = False
:}
```

Remember `_` is wildcard match. Patterns are scanned top-to-bottom and thus order them from most specific to least specific.