qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
               where
                    smaller = [a | a <- xs, a <= x]
                    larger  = [b | b <- xs, b > x]

qrsort [] = []
qrsort (x:xs) = qrsort larger ++ [x] ++ qrsort smaller
                where
                    larger = [a | a <- xs, a >= x]
                    smaller  = [b | b <- xs, b < x]