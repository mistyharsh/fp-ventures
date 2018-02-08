# Introduction
Data abstraction is the notion of separating use from representation so that you can think about these two problems separately. This is really very powerful programming methodology. Data abstraction create a horizontal barrier as shown below:

    use of data
    ======================= <- Boundary of data abstraction
    representation of data

But when designing a complex system, mere horizontal boundary is not enough. We also need some sort of vertical boundary when multiple people are working on a same layer.

There is a strategy for implementing generic operators. That strategy has a name: it's called **dispatch on type**. Vertical boundary problem introduces multiple issues:
1. Namespacing (multiple representations of complex number)
2. What happens when you bring somebody new into the system. It should not affect existing guys.

Using generic operators is called as data directed programming.