fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n-1)

prod :: Num a => [a] -> a
prod [] = 1
prod (n:ns) = n * prod ns

siz :: Num a => [a] -> a
siz [] = 0
siz (_:xs) = 1 + siz xs

ziper :: [a] -> [b] -> [(a, b)]
ziper [] _ = []
ziper _ [] = []
ziper (x:xs) (y:ys) = (x, y) : ziper xs ys

