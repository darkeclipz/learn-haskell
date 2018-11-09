-- Take the last element from the list.
last1 xs = drop (length xs - 1) xs
last2 xs = xs !! (length xs - 1)
last3 xs = head (reverse xs)

-- Remove the last element from a list.
init1 xs = reverse (tail (reverse xs))
init2 xs = take (length xs - 1) xs