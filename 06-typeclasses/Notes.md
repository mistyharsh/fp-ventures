# Typeclasses

To be able to put something in an enumerated list (Enum), they must be able to be ordered (Ord); to be able to order something, they must be able to be compared for equality (Eq).

## Equality
Some programming languages, like Java, bake equality into every object in the language, but some datatypes do not have a sensible notion of equality, so Haskell does not encode equality into every type.
