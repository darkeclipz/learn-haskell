sayHello :: String -> IO ()
sayHello x = putStrLn ("Hello, " ++ x ++ "!")

factorial n = product [1..n]

average ns = sum ns `div` length ns

double x = x + x
quadruple x = double (double x)