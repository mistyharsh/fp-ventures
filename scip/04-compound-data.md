# Introduction
When building large things, the crucial idea is to divorse the task of building things from the task of implementing the parts.

We would like the programming language to express the concepts that we have in our heads, like rational numbers are things that you can add and then take that result and multiply them.

LISP provide a glue to create compound data using List data structure and pairs. Pair is represented using **Box and Pointer** notation.

## Pair data structure
For any `x` and `y`

    (car (cons x y)) is x
    (cdr (cons x y)) is y

`cdr` is pronounced as `k-der`.

Looking at a rational number program, it is quite clear that you first have to find algorithm, write higher level blocks and then fill implementation. Never code before you do so. Imperative programs allow you to do that. Remember:
1. Algorithm
2. High level blocks
3. Compose high level blocks
4. Fill in implementation details

## Rational number program
Between `+RAT`, `*RAT` and `pair` we setup an abstraction layer. This layer was `MAKE-RAT`, `NUMER`, `DENOM`. This methodology is separating the way somthing is used, i.e., separating the use of data objects, from the representation of the data objects. This metholody has a name - **Data abstraction**.

Data abstraction is programming methodology of setting up data objects by postulating constructors and selectors to isolate use from representation.

What is the point of using data abstraction if we could do this without inventing all this terminology? What is the point of isolating the use from the representation. Well, it goes back to this notion of naming. One of the most important principles in programming is same as one of the most important principles in sorcery. If you have the name of the spirit, you get control over it.

In general, as system designers, you're forced with the necessity to make decisions about how you're going to do things. And, in general, the way you'd like to retain flexibility is to never make up your mind about anything until you are forced to do it.

The problem is, there's a very, very narrow line between deferring decisions and outright procrastination. So you'd like to make progress, but also at the same time, never be bound by the consequences of your decisions. Data abstraction is one way of doing things. What we did is we used wishful thinking.

Blue the line between what's data and what's procedure.