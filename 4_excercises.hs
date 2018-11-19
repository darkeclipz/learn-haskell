-- 1. define a function halve
halve :: [a] -> ([a], [a])
halve xs = (take (length xs `div` 2) xs, drop (length xs `div` 2) xs)

halve2 :: [a] -> ([a], [a])
halve2 xs = splitAt (length xs `div` 2) xs

-- 2. define a function third (returns third element) with 
--    head/tail, list indexing !!, pattern matching.
third1 :: [a] -> a
third1 xs = head (tail (tail xs))

third2 :: [a] -> a
third2 xs = xs !! 2

third3 :: [a] -> a
third3 (_:_:x:_) = x

-- 3. implement a function safetail, with
--    conditional expression, guarded equations, pattern matching.
null :: [a] -> Bool
null xs = length xs > 0

safetail1 :: [a] -> [a]
safetail1 xs = if Main.null xs then tail xs else []

safetail2 :: [a] -> [a]
safetail2 xs | Main.null xs = tail xs
             | otherwise    = []

safetail3 :: [a] -> [a]
safetail3 (_:xs) = xs
safetail3 (_) = []

-- 4. implement the disjunction operator (||) in four ways
--    using pattern matching
(||) :: Bool -> Bool -> Bool
True || _ = True
_ || True = True
False || False = False

-- 5. Show the meaning of the following pattern with conditional expressions:
--    True && True = True
--    _    && _    = False

and :: Bool -> Bool -> Bool
and a b = if a == True then 
            if b == True then True 
                else False 
            else False

-- 6. Do the same for the following pattern:
--    True && b = b
--    False && _ = False
and2 :: Bool -> Bool -> Bool
and2 a b = if a == True then b
            else False

-- 7. Show the meaning of the following curried function
--    using lambda expressions:
--    mult :: Int -> Int -> Int -> Int
--    mult x y z = x*y*z
mult :: Int -> Int -> Int -> Int
mult = \x -> (\y -> (\z -> x * y * z))

-- 8. Luhn algorithm, used to check bank card numbers.
--    - Consider each digit a seperate number
--    - moving left, double every other number from the second last
--    - subtract 9 from each number that is now greater than 9
--    - add all the resulting numbers
--    - if the total is divisible by 10, it is valid.
luhnSubtract :: Int -> Int
luhnSubtract x | x > 9     = x - 9
               | otherwise = x

luhnDouble :: Int -> Int
luhnDouble x = luhnSubtract (2 * x)

divisibleByTen :: Int -> Bool
divisibleByTen x = x `mod` 10 == 0

luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d = divisibleByTen (sum [luhnDouble a, b, luhnDouble c, d])