This repository serves as a reference to Haskell stuff.

# Haskell Prelude

## Standard

```haskell
head [1,2,3,4,5]    -- Select the first element.
tail [1,2,3,4,5]    -- Remove the first element from a non-empty list.
[1,2,3,4,5] !! 2    -- Select the nth element.
take 3 [1,2,3,4,5]  -- Select the first n elements.
drop 3 [1,2,3,4,5]  -- Remove the first n elements.
length [1,2,3,4,5]  -- Length of the list.
sum [1,2,3,4,5]     -- Sum a list of numbers.
product [1,2,3,4,5] -- Product of a list of numbers.
[1,2,3] ++ [4,5]    -- Append two lists.
reverse [1,3,4,5,]  -- Reverse a list.
last [1,2,3]        -- Takes the last element.
init [1,2,3]        -- Removes the last element from the list.
```

## Types

### Basic types

```haskell
Bool    -- logical values
Char    -- single characters
String  -- string of characters
Int     -- fixed-precision integers
Integer -- arbitrary-precision integers
Float   -- single-precision floating-point numbers
Double  -- double-precision floating-point numbers
```

### List types

```haskell
[False,True,False]          :: [Bool]
['a','b','c','d']           :: [Char]
["One", "Two", "Three"]     :: [String]
[['a','b'],['c','d','e']]   :: [[Char]]
```

### Tuple types

```haskell
(False,True) :: (Bool, Bool)
(False,'a',True) :: (Bool, Char, Bool)
('a',(False,'b')) :: (Char,(Bool,Char))
(['a','b'],[False,True]) :: ([Char], [Bool])
[('a',False),('b',True)] :: [(Char, Bool)]
```

### Function types

```haskell
not :: Bool -> Bool
even :: Int -> Bool
```

### Curried functions

```haskell
add' :: Int -> (Int -> Int)
add' x y = x+y
mult :: Int -> (Int -> (Int -> Int))
mult x y z = x*y*z
```

Function arrow `->` in types are evaluated from right to left, therefore:

```haskell
add' :: Int -> Int -> Int
mult :: Int -> Int -> Int -> Int
```

### Polymorphic types

```haskell
length :: [a] -> Int
fst :: [a] -> a
head :: [a] -> a
take :: Int -> [a] -> [a]
zip :: [a] -> [b] -> [(a,b)]
id :: a -> a
```

### Overloaded types

```haskell
(+) :: Num a => a -> a -> a
(*) :: Num a => a -> a -> a
negate :: Num a => a -> a
abs :: Num a => a ->
```

## Notation

### Function application in mathematics and Haskell:

|Mathematics|Haskell|
|--|--|
|f(x)|`f x`|
|f(x,y)|`f x y`|
|f(g(x))|`f (g x)`|
|f(x,g(x))|`f x (g y)`|
|f(x)g(x)|`f x * g y`|