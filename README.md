This repository serves as a reference to Haskell stuff.

# Haskell Prelude

## Standard

```haskell
head [1,2,3,4,5]    -- Select the first element.
tail [1,2,3,4,5]    -- Remove the first element from a non-empty list.
[1,2,3,4,5 !! 2     -- Select the nth element.
take 3 [1,2,3,4,5]  -- Select the first n elements.
drop 3 [1,2,3,4,5]  -- Remove the first n elements.
length [1,2,3,4,5]  -- Length of the list.
sum [1,2,3,4,5]     -- Sum a list of numbers.
product [1,2,3,4,5] -- Product of a list of numbers.
[1,2,3] ++ [4,5]    -- Append two lists.
reverse [1,3,4,5,]  -- Reverse a list.
```