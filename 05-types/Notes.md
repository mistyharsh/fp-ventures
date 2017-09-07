# Haskell Basic types

## Sum Type
Bool is a sum type with two constructors. For now, it’s enough to understand that sum type means or, or logical disjunction. We will look more closely at sum types in a later chapter.

## If Else in Haskell
Haskell doesn't have **if-else** **statement** but it does have **if-then-else** expression.

## Theory
In Haskell, there are six categories of entities that have names.
    * Term level: Term level is where your values live and is the code that executes when program is running
        Variables and Data Constructors
    * Type level: During compilation and static analysis
        Type variables, Type constructors and Typeclasses
    * Module level: Code organizations
        Name for module

In Haskell, you cannot create **untyped data**. Everything originates in a data constructor. Type systems are often problematic in many programming languages because they make life difficult due to:
    * Allow bad (not well-typed) programs to be written as type system is not coherent
    * Do not let us express many programs that should work.
    * Do not provide Haskell like REPL mechanism. Become slow, etc.

Just because you don't often declare type doesn't mean that Haskell gives a free hand. It infers types, aka, type inference.

Note: Symbol ```->``` is actually a type constructor for function. This works:
```haskell
:info (->)
data (->) t1 t2
```
This signifies that it takes t1 and returns t2. So every Haskell function takes exactly one argument and returns one value. This type has no data constructors. Thus **functions are values**.

A type signature can have multiple type constraints:
```haskell
(Num a, Num b) => a -> b -> b
(Ord a, Num a) => a -> Ordering
```
Here it represents conjunction or product.
