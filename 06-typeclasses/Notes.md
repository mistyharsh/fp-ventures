# Typeclasses

To be able to put something in an enumerated list (Enum), they must be able to be ordered (Ord); to be able to order something, they must be able to be compared for equality (Eq).

## Equality
Some programming languages, like Java, bake equality into every object in the language, but some datatypes do not have a sensible notion of equality, so Haskell does not encode equality into every type.

Haskell does not have notion of pointer equality. Remember you are dealing with very high level of abstration. When we talk about equality, there can be only one type of equality and that is value equality.

Unlike other languages, Haskell does not provide universal stringification (Show / print) or equality (Eq (value equality) or pointer equality) as this is not always sound or safe, regardless of what programming language you're using.

## Guidelines
Keep your typeclass instances for a type in the same file as type.
When we are automatically derving `Ord` typeclass, Data Constructor values to the left are less than values to the right:

```haskell
data DayOfWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving (Ord)
```
Usually, prefer minimally sufficient set of constraints on all your functions. So even if you have `Int` values in mind for doing equality check, then it is better to have `Eq` typeclass than `Int` concrete type. This makes intent of the code more clear and restricts us from things that we should not be using making sure you used the operations we intended.

## Parametric polymorphism
In case of parametric polymorphism, having no constraints on our term-level values means they could be any type, but there isn't much we can do with them.

**The methods and operations are in the typeclasses, and so we get more utility by specifying typeclass constraints.** Remember, it is Haskell, there is no `instanceof`, `instance` or `typeof` operation. You lose some sort of reflection, which I personally believe is a good thing. Remember, Haskell equivalent is pattern matching which is compile time feature.

```haskell
-- A function like this doesn't work without proper type signature
add :: a -> a -> a
add x y = x + y
```

Even following will not work. You need to add `Ord a` typeclass to the function. `Num` doesn't imply `Ord`
```haskell
-- Will not work
addWeird :: Num a => a -> a -> a
addWeird x y = if x > 1 then x + y else x
```

The class definition of `Ord` says that any `a` which wants to define an `Ord` instance must already provide and `Eq` instance. So can say that `Eq` is *superclass* of `Ord`.
```haskell
Prelude> :info Ord
Class Eq a => Ord a where...
```

There is no traditional inheritance in Haskell for subtype. However, typeclass inheritance is possible in haskell. But it is not true inheritance in a sense. It is more like dependency. For typeclass `X` to depend on `A` means for `X`, it needs to utitlize functionality from typeclass `A`. You cannot do overriding like traditional OOP. Typeclass hierarchy is always additive. That often simplifies. Traditional overriding sounds good theorotically. But in practice, it is always problematic because, you are simply flushing, overriding base/original/intended behavior in derived classes. It is pathetic.

## Automatic derivation of typeclasses
In Haskell we have **derived instances** so that obvious or common typeclasses, such as `Eq`, `Enum`, `Ord`, and `Show` can have the instances generated based only on how the datatype is defined. This is so programmers can make use of these conveniences without writing the code themselves, over and over. And yet, this is much better than other languages like Java, JS or C# where you always have common class Object or something similar.