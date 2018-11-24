import Data.List

toDigit xs = sum (map (\ (x,y) -> x * 10 ^ y) (zip (reverse xs) [0..]))
reversePermutations = reverse . permutations
pandigitals n = map toDigit (reversePermutations [1..n])
factorial n = product [1..n]
isPrime x = factorial (x-1) `mod` x == x - 1 -- Wilson's thm.

-- maximum (filter isPrime (pandigitals 9))