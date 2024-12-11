sum':: Num a => [a] -> a
sum' []     = 0
sum' (x:xs) = (+) x (sum' xs)

product':: Num a => [a] -> a
product' []     = 1
product' (x:xs) = (*) x (product' xs)

{-

product' [2, 3, 4] = (*) 2 (product' [3, 4])
                   = (*) 2 ((*) 3 (product' [4]))
                   = (*) 2 ((*) 3 ((*) 4 (product' [])))
                   = (*) 2 ((*) 3 ((*) 4 1))
                   = (*) 2 ((*) 3 4)
                   = (*) 2 12
                   = 24

-}

qs []     = []
qs (x:xs) = qs ys ++ [x] ++ qs zs
           where
              ys = [a | a <- xs, a <= x]
              zs = [b | b <- xs, b > x]

rqs []     = []
rqs (x:xs) = rqs ys ++ [x] ++ rqs zs
           where
              ys = [a | a <- xs, a > x]
              zs = [b | b <- xs, b <= x]


qsnr []     = []
qsnr (x:xs) = qs ys ++ [x] ++ qs zs
           where
              ys = [a | a <- xs, a < x]
              zs = [b | b <- xs, b > x]

main :: IO()
main = do
  print(sum' [2, 3, 4])
  print(product' [2, 3, 4])
  print(qs [3, 2, 1, 2, 3, 4, 35, 5, 64, 3, 6])
  print(rqs [3, 2, 1, 2, 3, 4, 35, 5, 64, 3, 6])
  print(qsnr [3, 2, 1, 2, 3, 4, 35, 5, 64, 3, 6])
