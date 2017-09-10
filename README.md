Personal Haskell Learning experience

<!-- Understanding polymorphism -->
https://www.quora.com/How-is-polymorphism-used-in-functional-programming-languages

<!-- Learning a about Haskell IO -->
https://wiki.haskell.org/Introduction_to_IO
https://www.haskell.org/tutorial/io.html
https://stackoverflow.com/questions/12226624/newbie-understanding-main-and-io

<!-- Understanding GHCi -->
https://stackoverflow.com/questions/42988950/let-vs-regular-assignment-in-ghci
https://stackoverflow.com/questions/14052093/ghci-let-what-does-it-do

# Expression in Haskell
In Haskell, expression is value, function or an actual expression. Haskell is all about mathematical expressions which are modelled after Mathematical notion of lambda calculus.

### Foldable type in JavaScript
Haskell String are foldable in a sense that you can concat them. Thus when you do:
```haskell
Prelude> :type concat
concat :: Foldable t => t [a] -> a
-- Note, Foldable t => t [a] is equivalent to [[a]]. Think Foldable t as some list.
```

**Foldable** type is less formally known as **concatable** type. String type is foldable but not Char type. Essential thing here is that concatable returns a same type. So concatenation of two strings produces string. (Dr. Booleans's videos for more details)

Or probably I am wrong. **Foldable** may not be **concatable**.
### List operator
(!!) is an operator on list to get item at certain index in a list.


## Guidelines
It is rarely a good idea to write a **partial function**. They will cause runtime exception.
Just like if-else, `case` statements are expressions.