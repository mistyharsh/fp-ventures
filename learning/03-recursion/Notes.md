# Recursion

Recursion is a means of expressing code that must take an **indefinite** number of steps to return a result.

Since lambda calculus expressions are anonymous, it seems impossible to have recursion in Lambda calculus. But recursive functions are essential to Turing completeness. For that we use combinator **(Y combinator or fixed-point combinator)** to write recursive functions. In Haskell, we have recursion based on the same principle as the Y combinator.

Recursive functions are similar to composite functions (composition). The difference is composition is static and definite, recursive functios are compositions which are indefinite. In short, **recursion is self-referential composition**.

Haskell like language, purely built on lambda calculus has only one verb: **APPLY** a function to an argument. Applying a function to an argument and returning a result is all we can ever really do, no matter what syntactic conveniences we construct to make it seem that we are doing more than that.

### Bottom
Incomplete pattern matches applied to data they don't handle will return bottom. Bottom is a non-value used to denote that the program cannot return a value or result. The most elemental manifestation of this is a program that loops infinitely. Other forms can involve things like writing a function that doesn’t handle all of its inputs and fails on a pattern match.

It is represented as `inverted T`. It means two things: Computations that failed with error and computations that failed to terminate. In logic, it is considered as `False` value. Bottom occurs when:
* Throw error
* Pattern matching fail (partial application)
* Never ending loop

A partial function that cannot handle all inputs can be made to work:
* Modify function and add `otherwise` case
* Use datatype `Maybe`. It prevents generation of bottom values