Actions are defined rather than invoked within the expression language of Haskell. Evaluating the definition of an action doesn't actually cause the action to happen. Rather, the invocation of actions takes place outside of the expression evaluation we have considered up to this point.

# Declaring variables within do/monad/context
When using simple file, we don't declare variables/values using `let` notation. However if we are within `ghci`, then we need to use `let` to declare variable. It is because `ghci` is always running in execution context, aka, `IO ()` monad.

So whenever you are using monad, you can use let to declare variable or call pure function and store its value in variable.

# Understanding Haskell IO

https://stackoverflow.com/questions/34280735/understanding-pure-functions-in-haskell-with-io

Given a Haskell function f:

```haskell
f :: IO Int
f = ...     -- ignoring its implementation
```

In short, is f (and IO ... functions in general) pure?

Short answer: Yes, that f is referential transparent.

Whenever you look at it, it equals the same value.
But that doesn't mean it will always bind the same value.

# Functors
You can think of `fmap` as either a function that takes a function and a functor and then maps that function over the functor, or you can think of it as a function that takes a function and lifts that function so that it operates on functors. Both views are correct and in Haskell, equivalent.