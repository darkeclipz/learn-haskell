-- 1. Use list comprehension to calculate: 1^2 + 2^2 + ... + 100^2
x = sum [x * x | x <- [1..100]]

-- 2. Coordinate grid (cartesian product)
grid :: Int -> Int -> [(Int, Int)]
grid m n = [(x, y) | x <- [0..m], y <- [0..n]]

-- 3. Coordinate square with size n (without diagonal)
square :: Int -> [(Int, Int)]
square n = [(x, y) | (x, y) <- grid n n, x /= y]

-- 4. Replicate
replicate :: Int -> a -> [a]
replicate n a = [a | _ <- [1..n]]

-- 5. Pythagorean triplets
pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

-- 6. Perfect numbers
factors :: Int -> [Int]
factors x = [x' | x' <- [1..x-1], x `mod` x' == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], sum (factors x) == x]

-- 7. List comprehension with a single generator
y = [(x,y) | x <- [1,2], y <- [3,4]]

-- 9. Scalar product
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum [x * y | (x, y) <- zip xs ys]