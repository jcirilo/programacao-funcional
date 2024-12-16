{-
3. Mostre como a função de biblioteca last, que 
seleciona o último elemento numa lista, pode ser 
definida usando funções introduzidas nesta aula. 
Dá para pensar em outra definição? Mostre!
-}

last':: Num a => [a] -> a
last' xs = xs !! ((length xs) - 1)


{-
4. Coloque entre parêntesis as seguintes 
expressões numéricas

2^3*4
2*3+4*5
2+3*4^5
-}

a = (2^3)*4
b = (2*3)+(4*5)
c = 2+(3*(4^5))

{-
5. Da mesma forma, mostre como a função de 
biblioteca init, que remove o último elemento 
de uma lista, pode ser definida de duas 
maneiras diferentes
-}

init1:: Num a => [a] -> [a]
init1 [] = []
init1 xs = take ((length xs) - 1) xs

init2:: Num a => [a] -> [a]
init2 [] = []
init2 xs = reverse (tail (reverse xs))