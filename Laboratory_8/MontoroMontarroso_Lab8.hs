import Data.Ord
import Data.Eq
--Ejercicio 30
--Apartado a
digit::Char->Bool
digit x = x `elem` ['0'..'9']

--Apartado b
uppercase::Char->Bool
uppercase x = x `elem` ['A'..'Z']

lowercase::Char->Bool
lowercase x = x `elem` ['a'..'z']

--Apartado c
letter::Char->Bool
letter x = x `elem` ['A'..'Z'] || x `elem` ['a'..'z']

--Apartado d


--Ejercicio 31
--Apartado a
among::(Eq x)=>(x,[x]) -> Bool
among (y,[]) = False
among (y,(z:zs)) = if y==z then True else among(y,zs)

--Apartado b
stringcopy:: Int->String->String
stringcopy a b = if a>0 then ((b ++ stringcopy (a-1) b)) else error "numero negativo"

--Apartado c
strcop:: Int->String->String
strcop 0 b = b
strcop a b = b ++ strcop (a-1) b

--Ejercicio 32
data Valor= As| Dos | Tres | Cuatro | Cinco | Seis | Siete | Ocho | Nueve | Sota | Caballo | Rey deriving (Eq,Show)
data Palo= Oros|Copas|Espadas|Bastos deriving (Eq,Show)
data Carta= Carta  Valor Palo deriving (Eq,Show)

palode:: Carta->Palo
palode (Carta _ x)=x

valorde:: Carta->Valor
valorde (Carta x _)=x

espalo:: Palo->Carta->Bool
espalo x (Carta _ y)= x==y

esvalor:: Valor->Carta->Bool
esvalor x (Carta y _)= x==y

--Ejercicio 33

data Saco s = S[(s,Int)]

add::(Eq s, Ord s)=> s -> Saco s -> Saco s
add a (S y)= S (add2 a y)
add2 l[]=[(l,1)]
add2 l((f,x):y)|l==f =(f,x+1):y | l<f =(l,1):(f,x):y | l>f=(f,x):add2 l y

remove:: Saco s -> (s, Saco s)
remove(S y)=remove2 y
remove2 []=error"Saco is is empty"
remove2 ((l,1):y)= (l, S y)
remove2 ((l,x):y)=(l,S((l,x+1):y))

isEmpty:: Saco s ->Bool
isEmpty(S [])= True
isEmpty _ = False

--Ejercicio 34
reduce:: (alpha->beta->beta)->beta-> [alpha]->beta
reduce f b [] =b
reduce f b (n:l)=f n (reduce f b l)

--apartado a
mapR f []= []
mapR f (x:xs)= reduce (\y -> (\z->(f y):z)) [] (x:xs)

appR [] (x:xs)=(x:xs)
appR (x:xs) y=reduce (\z -> (\w -> z:w)) y (x:xs)

--apartado b
amongLR x []= False
amongLR x (y:ys)= reduce (\next->(\isthea->(if next==x then True else isthea))) False (y:ys)



--Ejercicio 35
uncurry :: (alpha->beta->gamma) -> ((alpha,beta)->gamma)
uncurry f (x,y)= f x y

