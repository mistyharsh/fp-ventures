# Procedure

Programmer needs to understand relationship between things he writes (the spells) and the behavior of the process that he's attempting to control.

## Substitution Model

Simplest model to understand how procedures work and how processes work, and in particular procedures yield processes.

Model is often just an approximation of how things work in work. Similarly, **Substitution** model will not work always. Then we will go in more details.

### Kinds of Expressions

* Numbers: 123, 4.5
* Symbols: \*, +
* Lambda epxressions
* Definitions
* Conditionals
* Combinations

Lambda, definitions and conditionals are special forms.

### Substitution Rule (Evaluation)

* To evaluate an application/combination
  * Evaluate the operator to get procedure
  * Evaluate the operands to get arguments
  * Apply the procedure to the arguments
    * Copy the body of the procedure, substituting the arguments applied for the formal parameters of the procedure.
    * Evaluate the resulting new body

You have the freedom to choose any arbitrary order to evaluate arguments viz. left-to-right or vice-a-versa.

### Conditional
    (IF <predicate>
        <consequent>
        <alternative>)

## Law of complexity

One of the things we have to do is to ignore details. The to understanding complicated things is to know what not to look at and what not to compute and what not to think.

It is all about evaluate of a complex expression to single value.

## Program and Process co-relation

To understand how procedure yeild process, consider two programs that produce identical result in two different way. Apply a substitution model to these programs and see how process evolves. Simple example is (+) program. You will note that these processes will have very different shapes. Feel these shapes.

There are two types of processes:

| Process           | Time complexity | Space Complexity |
| ----------------- | --------------- | ---------------- |
| Iterative Process | O(n)            | O(1)             |
| Recursive Process | O(n)            | O(n)             |
Video 2 of SCIP mentions linear type of recursion.

There is nothing special about the fact that the definition is recursive that leads to a recursive process.

What matters about time complexity is the bound. Any machine could do something in constant space when we have O(1).

An iteration is a system that has all of its state in explicit variables. Recursion is not quite the same. If I were to lose the pile of junk, the recursion cannot continue. Recursion also has information under the table belonging to the computer, which is what things have been deferred for later. (This is what make recursion powerful. It can enable computers to do optimization on your behalf such as concurrency, etc.) Recursion is bureaucratic system.