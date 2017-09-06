# Little mathematics
A mathematical idea of a valid function:
    1. It always returns a value
    2. Produces same value (co-domain) for same input (domain)

The essense of functional programming is that programs are a combination of expressions to be evaluated.

## Beta reduction
When you apply the function, you substitute the input expression for all instances of bound variables within the abstraction, a process is known as beta reduction. Haskell performs a beta reduction when a function is executed.
Example:
```haskell
add x y = x + y + x

-- Beta reduction
add (1 + 4) (5 -1) = (1 + 4) + (5 - 1) + (1 + 4)

-- Non-beta reduction
add (1 + 4) y = (5) + y + (5)
```

## Evaluation
In Haskell, evaluation is simplification. Haskell uses Beta Normal Form. BNF is when you cannot beta reduce the terms any further. This corresponds to "fully evaluated" expression. In programming context, we would call this a "fully executed" program
