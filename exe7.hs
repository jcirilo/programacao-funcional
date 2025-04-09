-- JOÃO VICTOR DA SILVA CIRILO 20200019609
-- EXERCICIO 7: FUNÇÕES DE ALTA ORDEM

{-
    2.  Sem examinar as definições do padrão prelúdio,
        defina as seguintes funções de alta ordem em
        listas disponíveis nesta biblioteca

        a.  Decidir se os elementos de uma lista 
            satisfazem um predicado
            all :: (a -> Bool) -> [a] -> Bool
-}

-- usando o operador de composição (.):
-- (.) :: (b -> c) -> (a -> b) -> (a -> c)
-- f . g = \x -> f (g x)

all' :: (a -> Bool) -> [a] -> Bool
all' p = and . map p

{-
        b.  Decidir se algum elemento de uma lista
            satisfaz um predicado
            any :: (a -> Bool) -> [a] -> Bool
-}

any' :: (a -> Bool) -> [a] -> Bool
any' p = or . map p

{-
        c.  Selecionar elementos enquanto satisfazem
            um predicado
            takeWhile :: (a -> Bool) -> [a] -> [a]
-}

{-
        d.  Remover elementos enquanto eles
            satisfazem um predicado
            dropWhile :: (a -> Bool) -> [a] -> [a]
-}

{-
    3.  Redefina map f e filter p usando a 
        função foldr

-}

-- padrão:
-- f [] = v
-- f (x:xs) = x # f xs

-- função:
-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- foldr f v [] = v
-- foldr f v (x:xs) = f x (foldr f v xs)

map' f = foldr (\x xs -> f x : xs) []

filter' p = foldr (\x xs -> if p x then x:xs else xs) []

{-
    4.  Usando foldl, defina uma função

        dec2int :: [Int] -> Int
        
        que converte um número decimal em um 
        inteiro, por exemplo

            > dec2int [2,3,4,5]
            2345

-}

-- padrão:
-- f v [] = v
-- f v (x:xs) = f (v # x) xs

-- função:
-- foldl :: (a -> b -> a) -> a -> [b] -> a
-- foldl f v [] = v
-- foldl f v (x:xs) = foldl f (f v x) xs

dec2int :: [Int] -> Int
dec2int [] = 0
dec2int (x:xs) = foldl (\x y -> x*10+y) 0