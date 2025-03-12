-- Atividade Capítulo 6 - Funções Recursivas  
-- JOÃO VICTOR DA SILVA CIRILO - 20200019609

{-
1. Defina o operador de exponenciação ^ para 
inteiros não negativos usando o mesmo 
padrão de recursão que o operador de 
multiplicação * e mostre como a expressão 2^3 
é avaliada usando sua definição.
-}

exp' :: Int -> Int -> Int
exp' _ 0 = 1
exp' x n = x * (exp' x (n - 1))

{-
Avaliação da expressão 2^3
2 ^ 3
= 2 * (exp' 2 (3-1))
= 2 * (exp' 2 2)
= 2 * (2 * (exp' 2 (2-1)))
= 2 * (2 * (exp' 2 1))
= 2 * (2 * (2 * (exp' 2 (1-1)))
= 2 * (2 * (2 * (exp' 2 0))
= 2 * (2 * (2 * 1)
= 2 * (2 * 2)
= 2 * 4
= 8
-}

{-
2. Usando as definições recursivas fornecidas
neste capítulo, mostre como length [1,2,3],
drop 3 [1,2,3,4,5] e init [1,2,3] são avaliados
-}

length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

{-
length' [1,2,3]
= 1 + length' [2,3]
= 1 + (1 + length' [3])
= 1 + (1 + (1 + length' []))
= 1 + (1 + (1 + 0))
= 3
-}

drop' :: Int -> [a] -> [a]
drop' 0 xs = xs
drop' _ [] = []
drop' n (_:xs) = drop' (n - 1) xs

{-
drop' 3 [1,2,3,4,5]
= drop' 2 [2,3,4,5]
= drop' 1 [3,4,5]
= drop' 0 [4,5]
= [4,5]
-}

init' :: [a] -> [a]
init' [_] = []
init' (x:xs) = x : init' xs

{-
init [1,2,3]
= 1 : init [2,3]
= 1 : (2 : init [3])
= 1 : (2 : [])
= [1,2]
-}

{-
3. Sem olhar para o padrão prelude, defina
as seguintes funções de biblioteca usando
recursão

3.a. Decida se todos os valores booleanos
     em uma lista são verdadeiros

    and :: [Boll] -> Bool

3.b. Concatenar uma lista de listas
    concat :: [[a]] -> [a]

Nota: a maioria dessas funções são definidas
no prelúdio usando outras funções de biblioteca
em vez de usar recursão explícita e são funções
genéricas em vez de serem específicas para o
tipo de listas.
-}

and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = x && and' xs


concat' :: [[a]] -> [a]
concat' [] = []
concat' (xs:xss) = xs ++ concat' xss

{-
4. Defina uma função recursiva 
insert :: Ord a => a > [a] > [a]
que insere em ordem um elemento x em uma lista 
ordenada de valores para fornecer uma lista 
resultante ordenada, por exemplo

> insert 2 [1,3,4]
[1,2,3,4]
-}

insert' :: Ord a => a -> [a] -> [a]
insert' x [] = [x]
insert' x (y:ys)
    | x <= y    = x : y : ys
    | otherwise = y : insert' x ys

{-
5. Defina uma função recursiva
isort :: Ord a => [a] -> [a]
que implementa o algoritmo insertion sort, 
especificado pelas duas regras a seguir

5.a. Listas de comprimento <= 1 já estão
     ordenadas

5.b. A partir do segundo elemento da lista, 
     compara-se com os anteriores para inserir 
     na posição correta, e repete-se o 
     processo para o elemento seguinte da lista
-}

isort' :: Ord a => [a] -> [a]
isort' [] = []
isort' [x] = [x]
isort' (x:xs) = insert' x (isort' xs)

{-
isort' [3,1,4,2]
= insert' 3 (isort' [1,4,2])
= insert' 3 (insert' 1 (isort' [4,2]))
= insert' 3 (insert' 1 (insert' 4 (isort' [2])))
= insert' 3 (insert' 1 (insert' 4 [2]))
= insert' 3 (insert' 1 [2,4])
= insert' 3 [1,2,4]
= [1,2,3,4]
-}