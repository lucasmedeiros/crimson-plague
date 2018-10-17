getHead :: [a] -> a
getHead b = head b

getSize :: [a] -> Int
getSize [] = 0
getSize (x:xs) = 1 + getSize(xs)

getElem :: [Int] -> Int -> Int
getElem x y = x !!y

dobraLista :: [Int] -> [Int]
dobraLista [] = []
dobraLista (x:xs) = [x * 2] ++ dobraLista xs 

