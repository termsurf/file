-- | Sorts the given list in an ascending order.
quickSort :: (Ord a) => [a] -> [a]
quickSort []       = []
quickSort (x : xs) =
    let (lt, gt) = partition (<= x) xs
    in  (quickSort lt) ++ [x] ++ (quickSort gt)
