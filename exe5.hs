{---------------------------------------------

COMPREENSÃO DE LISTAS

João Victor da Silva Cirilo - 20200019609

---------------------------------------------
(4) 
De maneira semelhante à função length,
mostre como a função de biblioteca

replicate :: Int → a → [a]

que produz uma lista de elementos idênticos
pode ser definida usando compreensão de lista,

por exemplo

> replicate 3 True
[True,True,True]
---------------------------------------------}

replicate' :: Int -> a -> [a]
replicate' n x = [ x | _ <- [1..n]]

{---------------------------------------------
(6)
Um inteiro positivo é perfeito se for igual à
soma de todos os seus fatores, excluindo o
próprio número. Usando compreensão de lista,
defina uma função

perfects :: Int → [Int]

que retorna a lista de todos os números perfeitos
até um determinado limite, por exemplo

> perfects 500
[6,28,496]
---------------------------------------------}

fatores :: Int -> [Int]
fatores n = [x | x <- [1..n-1], mod n x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], sum (fatores x) == x]

{---------------------------------------------
(7)
Mostre como a compreensão da lista
[(x,y) | x <- [1,2], y <- [3,4]] com dois
geradores pode ser reexpressa usando duas
compreensões com geradores únicos. Dica:
aninhe uma compreensão dentro da outra e
faça uso da função de biblioteca concat ::
[[a]] -> [a]
---------------------------------------------}

zip' (x:xs) (y:ys) = [(x, y)]

{----------------------------------------------
(8)
Redefina a função positions usando a função
find
----------------------------------------------}
