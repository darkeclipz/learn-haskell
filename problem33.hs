-- Problem 33 - Digit cancelling fractions (Project Euler)
--
-- The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
-- We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
-- There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
-- If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

div10 :: Int -> Bool
div10 n = n `mod` 10 == 0

dropLastDigit :: Int -> Int
dropLastDigit n = n `div` 10

test :: Int -> Int -> Bool
test x y = (dropLastDigit x) `div` (dropLastDigit y) == x `div` y

digits :: Int -> [Int]
digits x = [x `div` 10] ++ [x `mod` 10] 

commonDigits :: [Int] -> [Int] -> [Int]
commonDigits xs ys = [x | x <- xs, x `elem` xs && x `elem` ys]

hasCommonDigits :: [Int] -> [Int] -> Bool
hasCommonDigits xs ys = length (commonDigits xs ys) > 0

hasOneCommonDigit :: [Int] -> [Int] -> Bool
hasOneCommonDigit xs ys = length (commonDigits xs ys) == 1

fractions = [(digits x, digits y) | x <- [10..99], y <- [10..99], not (div10 x && div10 y)]
fractionsWithCommonDigits = [(x,y) | (x,y) <- fractions, hasOneCommonDigit x y]

cancelDigits :: ([Int], [Int]) -> (Int, Int)
cancelDigits (xs, ys) = (head x, head y)
                        where
                            common = commonDigits xs ys
                            x = [x' | x' <- xs, not (x' `elem` common)]
                            y = [y' | y' <- ys, not (y' `elem` common)]

divide :: (Int, Int) -> Float
divide (x, y) = fromIntegral x / fromIntegral y

--join :: ([Int], [Int]) -> (Int, Int)
--join (xs, ys) = 10*(head x) + head y
                            
--fractionsDigitCancelled = [(x,y) | (xs,ys) <- fractionsWithCommonDigits, divide (cancelDigits (x,y)) == divide (join (x, y)) ]