-- 2
-- A - third utilizando head e tail
third :: [a] -> a
third xs = head (tail (tail xs))

-- B - third utilizando indexação de listas !!
third' :: [a] -> a
third' xs = xs !! 2

-- C - third utilizando casamento de padrão
third'' :: [a] -> a
third'' (_:_:x:_) = x

-- 3
-- A - safetail utilizando expressao condicional
safetail :: [a] -> [a]
safetail xs = if null xs
               then []
               else tail xs

-- B - sagetail utilizando guarded equations
safetail' :: [a] -> [a]
safetail' xs | null xs  = []
             | otherwise = tail xs

-- C - safetail utilizando casamento de padrões
safetail'' :: [a] -> [a]
safetail'' [] = []
safetail'' (x:xs) = xs

-- 7

mult :: Int -> Int -> Int -> Int
mult x y z = x*y*z

-- significa:
mult' x y = \z -> x*y*z

-- que significa:
mult'' x = \y -> \z -> x*y*z

-- que significa:
mult''' :: Int -> Int -> Int -> Int
mult''' = \x -> \y -> \z -> x*y*z

-- 8
-- algoritmo de Luhn

luhnDouble :: Int -> Int
luhnDouble x = if a > 9
               then a - 9 
               else a
               where a = x*2

luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d = (mod (luhnDouble a + b + luhnDouble c + d) 10) == 0