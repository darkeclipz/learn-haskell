-- 1. What are the types of the following values?
a :: [Char]
a = ['a', 'b', 'c']

b :: (Char, Char, Char)
b = ('a', 'b', 'c')

c :: [(Bool, Char)]
c = [(False, '0'),(True, '1')]

d :: ([Bool], [Char])
d = ([False, True],['0','1'])

e :: [[a] -> [a]]
e = [tail, init, reverse]

-- 2. Write down the definitions that have the following types:

bools :: [Bool]
bools = [True, False, True]

nums :: [[Int]]
nums = [[1,2,3], [4,5,6]]

add :: Int -> Int -> Int -> Int
add a b c = a+b+c

copy :: a -> (a,a)
copy a = (a, a)

apply :: (a -> b) -> a -> b
apply f x = f x