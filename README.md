This repository serves as a reference to Haskell stuff.

# Table of Contents

 * [Standard](#standard)
 * [Types](#types)
    * [List types](#list-types)
    * [Tuple types](#tuple-types)
    * [Function types](#function-types)
    * [Curried functions](#curried-functions)
    * [Polymorphic types](#polymorphic-types)
    * [Overload types](#overload-types)
 * [Basic classes](#basic-classes)
   * [Equality types `Eq`](#eq----equality-types)
   * [Ordered types `Ord`](#ord----ordered-types)
   * [Showable types `Show`](#show----showable-types)
   * [Readable types `Read`](#read----readable-types)
   * [Numeric types `Num`](#num----numeric-types)
   * [Integral types `Integral`](#integral----integral-types)
   * [Fractional types `Fractional`](#fractional----fractional-types)
 * [Defining functions](#defining-functions)
   * [Conditional expressions](#conditional-expressions)
   * [Guarded equations](#guarded-equations)
   * [Pattern matching](#pattern-matching)
   * [Lambda expressions](#lambda-expressions)
   * [Operator sections](#operator-sections)
  * [List comprehensions](#list-comprehensions)
  * [Recursive functions](#recursive-functions)
  * [High-order functions](#high-order-functions)
  * [Declaring types and classes](#declaring-types-and-classes)
  * [Monads and more](#monads-and-more)
  * [Foldables and friends](#foldables-and-friends)
  * [Lazy evaluation](#lazy-evaluation)
  * [Notation](#notation)

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
(False,True)             :: (Bool, Bool)
(False,'a',True)         :: (Bool, Char, Bool)
('a',(False,'b'))        :: (Char,(Bool,Char))
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
fst    :: [a] -> a
head   :: [a] -> a
take   :: Int -> [a] -> [a]
zip    :: [a] -> [b] -> [(a,b)]
id     :: a -> a
```

### Overload types

```haskell
(+)    :: Num a => a -> a -> a
(*)    :: Num a => a -> a -> a
negate :: Num a => a -> a
abs    :: Num a => a ->
```

## Basic classes

A _class_ is a collection of types that support certain overloaded operations called _methods_.

### `Eq` -- equality types

```haskell
(==) :: a -> a -> Bool
(/=) :: a -> a -> Bool
```

All basic types `Bool`, `Char`, `String`, `Int`, `Integer`, `Float`, and `Double` are instances of the `Eq` class.

### `Ord` -- ordered types

This class contains types that are instances of the equality class `Eq`, but in addition whose value are totally (linearly) ordered. They can be compared with the following methods:

```haskell
(<)  :: a -> a -> Bool
(<=) :: a -> a -> Bool
(>)  :: a -> a -> Bool
(>=) :: a -> a -> Bool
min  :: a -> a -> a
max  :: a -> a -> a
```

All basic types `Bool`, `Char`, `String`, `Int`, `Integer`, `Float`, and `Double` are instances of the `Eq` class, as are lists and tuple types (sorted lexicographically).

### `Show` -- showable types

This class contains types whose values can be converted into strings of characters using the following method:

```haskell
show :: a -> String
```

All basic types `Bool`, `Char`, `String`, `Int`, `Integer`, `Float`, and `Double` are instances of the `Show` class, as are lists and tuples. Example usage:

```haskell
show False
show 'a'
show [1,2,3]
```

### `Read` -- readable types

This class is dual to `Show`, and contains types whose values can be converted from strings of characters using the following method:

```haskell
read :: String -> a
```

All basic types `Bool`, `Char`, `String`, `Int`, `Integer`, `Float`, and `Double` are instances of the `Read` class, as are lists and tuples. Example usage:

```haskell
read "False" :: Bool
read "'a'" :: Char
read "123" :: Int
```

### `Num` -- numeric types

This class contains types whose values are numeric, and as such can be processed using the following six methods:

```haskell
(+)    :: a -> a -> a
(-)    :: a -> a -> a
(*)    :: a -> a -> a
negate :: a -> a
abs    :: a -> a
signum :: a -> a
```

The basic types `Int`, `Integer`, `Float`, and `Double` are instances of the `Num` class.

### `Integral` -- integral types

This class contains types that are instances of the numeric class `Num`, but in addition whose values are integers, and as such support the moethods of integer division and integer remainder.

```haskell
div :: a -> a -> a
mod :: a -> a -> a
```

The basic types `Int` and `Integer` are instances of the `Integral` class.

### `Fractional` -- fractional types

This class contains types that are instances of the numeric class `Num`, but in addition whose values are non-integral, and as such support the methods of fractional division and fractional reciprocation:

```haskell
(/)   :: a -> a -> a
recip :: a -> a
```

## Defining functions

### New from old

Perhaps the most straightforward way to define new functions is simply by combining one or more existing functions:

```haskell
-- Decide if an integer is even.
even :: Integral a => a -> Bool
even n = n `mod` 2 == 0

-- Split a list at the nth element.
splitAt :: Int -> [a] -> ([a], [a])
splitAt n xs = (take n xs, drop n xs)

-- Reciprocation.
recip :: Fractional a => a -> a
recip n = 1/n
```

### Conditional expressions

The simplest are _conditional expressions_, which use a logical expression called a _condition_ to choose between two results of the same type.

```haskell
abs :: Int -> Int
abs n = if n >= 0 then n else -n
```

Conditional expressions may be nested:

```haskell
signum :: Int -> Int
signum n = if n < 0 then -1 else
                if n == 0 else -1
```

Conditional expressions in Haskell always must have an `else` branch, which avoids the well-known _dangling else_ problem.

### Guarded equations

As an alternative to using conditional expressions, functions can also be defined using _guarded equations_, in which a sequence of logical expressions called _guards_ is used to choose between a sequence of results of the same type.

```haskell
abs n | n >= 0 = n
      | otherwise = -n
```

Definitions with multiple guard are easier to read. For example, the function `signum`:

```haskell
signum n | n < 0     = -1
         | n == 0    = 0
         | otherwise = 1
```

### Pattern matching

Many functions have a simple and intuitive definition using _pattern matching_, in which a sequency of syntactic expressions called _patterns_ is used to choose between a sequence of results of the same type.

```haskell
not :: Bool -> Bool
not False = True
not True  = False
```

Functions with more than one argument can also be defined using pattern matching, for example:

```haskell
(&&) :: Bool -> Bool -> Bool
True  && True = True
True  && False = False
False && True = False
False && False = False
```

This definition can be simplified using the wildcard `_` pattern:

```haskell
True && True = True
_    && _    = False
```

This version also benefits from lazy evaluation:

```haskell
True  && b = b
False && _ = False
```

It can also be implemented with a guard:

```haskell
b && c | b == c    = b
       | otherwise = False
```

#### Tuple patterns

A tuple of patterns is itself a pattern, which matches any list of the same length whose elements all match the corresponding pattern in order. For example:

```haskell
fst :: (a,b) -> a
fst (x,_) = x

snd :: (a,b) -> b
snd (_,y) = y
```

#### List patterns

Similarly, a list of patterns is itself a pattern, which matches any list of the same length whose elements all match the corresponding patterns in order.

```haskell
test :: [Char] -> Bool
test ['a',_,_] = True
test _         = False
```

The libary functions `head` and `tail` are defined as follows:

```haskell
head :: [a] -> a
head (x:_) = x

tail :: [a] -> a
tail (_:xs) = xs
```

### Lambda expressions 

As an alternative to defining functions using equations, functions can also be constructed using _lambda expressions_, for example:

```haskell
(\x -> x + x) 5
```

They can be used to formalize the meaning of curried functions:

```haskell
add :: Int -> Int -> Int
add x y = x + y

add :: Int -> Int -> Int
add = \x -> (\y -> x + y)
```

Secondly, they can be used to explicitly show that a function is returned as a result:

```haskell
const :: a -> b -> a
const x _ = x

const :: a -> (b -> a)
const x = \_ -> x
```

Finally, they can be used to avoid naming a function that is used only once in a program:

```haskell
odds :: Int -> [Int]
odds n = map f [0..n-1]
         where f x = x*2 + 1

odds :: Int -> [Int]
odds n = map (\x -> x*2 + 1) [0..n-1]
```

### Operator sections

See page 44.

## List comprehensions

In Haskell, comprehension notation can be used to construct new lists from existings lists, for example:

```haskell
[x^2 | x <- [1..5]]
```

In this example `x <- [1..5]` is called a _generator_. It is also possible to create a pairing between two lists:

```haskell
[(x,y) | x <- [1,2,3], y <- [4,5]]
[(x,y) | y <- [4,5], x <- [1,2,3]]
```

Some library functions are implemented with this method, such as:

```haskell
-- concat
concat :: [[a]] -> [a]
concat xss = [x | xs <- xss, x <- xs]

-- firsts
firsts :: [(a,b)] -> [a]
firsts ps = [x | (x,_) <- ps]

-- length
length :: [a] -> Int
length xs = sum [1 | _ <- xs]
```

### Guards

List comprehensions can also use logical expressions called _guards_ to filter the values produced by earlier generators, for example:

```haskell
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

prime :: Int -> Bool
prime n = factors n == [1,n]

primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]
```

A function `find` that returns the list of all values that are associated with a given key in a table can be defined as follows:

```haskell
find :: Eq => a -> [(a,b)] -> [b]
find k t = [v | (k', v) <- t, k == k']

-- example
find 'b' [('a',10),('b',5),('c',2),('b',-2)]
[5,-2]
```

### The `zip` function

...

### String comprehensions

Because strings are lists, any polymorphic function on lists can be used with strings, for example:

```haskell


## Recursive functions

## Higher-order functions

## Declaring types and classes

## Monads and more

## Foldables and friends

## Lazy evaluation

## Notation

### Function application in mathematics and Haskell:

|Mathematics|Haskell|
|--|--|
|f(x)|`f x`|
|f(x,y)|`f x y`|
|f(g(x))|`f (g x)`|
|f(x,g(x))|`f x (g y)`|
|f(x)g(x)|`f x * g y`|