Just like sorcerer, we are going to conjure our spirits in a magical language call lisp, which is a language designed for talking, for casting the spells that are procedures to direct the processes.

It takes just few hours to learn all of LISP. But it takes years to master them. (Just like a game of chess)

In computer science, we are in the business of formalizing this sort of how-to imperative knowledge, how to do stuff. Real problem come when we try to build very, very large systems, computer programs that are thousands of pages long that nobody can get hold of them in their heads all at home. It is possible because there are techniques for controlling complexities of these large systems. And in some sense, that is computer science is all about.

Techniques to address complexity (three major topics):
1. Black-box abstraction
2. Conventional interfaces (agreed upon ways of pluggin things together)
3. Metalinguistic Abstraction (Making new languages - sometimes only way to tackle complexity is to pick a new design language)


Black box abstraction:
1. List made up of primitive objects
    1. Primitive procedures
    2. Primitive data
2. Means of combination
    1. Procedure composition
    2. Construction of compound data
3. Means of abstraction (once you combine stuff, how do you abstract those)
    1. Procedure definition
    2. Simple data abstraction
4. Capture common patterns (expert mode; what is procedure and what is data becomes blur and blurrier)
    1. Higher order procedures
    2. Data as procedure


Conventional interfaces:
How to extend same idea to different sort of concepts (data, example of addition - numbers, polynomials, electrical signals, etc.). It should express general idea. But there is problem, somewhere there has to be the knowledge of the kind of various things you can add and the ways  of adding them. Question is where do I put that kind of knowledge? At the same time, I should be able to add new objects without screwing up the system. Typically, we address:
1. Generic operations
2. Large scale structure and modularity (putting together very large scale applications)

Two important metaphors for putting together such systems
1. Object oriented programming (think of your system as a kind of society full of little things that interact by sending information between them).
2. Operations on aggregates (streams - think of a large system put like a signal processing engineer puts together a large electrical system).

Making new language
New design language will supress some kind of details and emphasize new/other kinds of details. Deal with how you construct new languages.
1. Interpretation - app-eval loop
2. Example - Logic programming
3. Register machines

How to evaluate a language? And, this is the only criterion.
1. Primitive elements
2. Means of combination
3. Means of abstraction

Primitive data
Say 3. Now three is not a number three. It a symbol that represents idea of value three in Plato's world. Same goes for 17.4 number. Just like this, symbol + is the name for Plato's concept of how you add things.

Combination
(+ 3 17.4 5) is call combination. + is operator. Numbers are operands. Lisp uses prefix notation. It is more elegant. Parentheses make LISP totally unambiguous. In Math, parentheses are grouping. In Lisp, it is different parentheses (you cannot remove them or you cannot add anthing extra).

Defining stuff
(DEFINE A (* 5 5))

(DEFINE (SQUARE X) (* X X))

But this definition is not clear to say I am naming something:
(DEFINE SQUARE (LAMBDA (x) (* x x)))

Lambda is a way of saying  - make a procedure. These two are same things. Lisp doesn't make distinction between the two. This is known as syntactic sugar. We prefer first form. The value of `SQUARE` in our case is some sort of compound procedure.

IMPORTANT - A key thing is lisp that you do not make arbitrary distinction between things that happen to be primitive in the language and things that happen to be built in.

Case Analysis (if-else statement)
(DEFINE (ABS x)
    (COND ((< x 0) (-x)
          ((= x 0) 0))
          ((> x 0) x)))