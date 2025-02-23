{-

ALUNO:      JOÃO VICTOR DA SILVA CIRILO
MATRÍCULA:  20200019609
E-MAIL:     joao.cirilo@academico.ufpb.br

-}

------------------------- QUESTÃO 1 -------------------------

double :: Num x => x -> x
double x = x + x

forma0 = double (double 2)
forma1 = double (double (double 1))
forma2 = double 2 + double 2

main :: IO()
main = do
    print (forma0)
    print (forma1)
    print (forma2)

------------------------- QUESTÃO 2 -------------------------
{-


Construindo a função sum [], temos:

sum [] = 0                 (0 para quando a lista for vazia)
sum (x:xs) = x + sum xs    (x é a cabeça da lista e xs os elementos seguintes).

A lista [x] é equivalente à x:[], sendo assim,
se simularmos a entrada [x] em sum (x:xs) temos:

1a chamada:
    sum [x] = x + sum []

2a chamada substituindo sum[]:
    sum [x] = x + 0

finalmente, simplificando:
    sum [x] = x


-}