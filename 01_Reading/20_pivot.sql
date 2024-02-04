/* Se utiliza la subquery "subquery" para obtener el valor de "Name" y "Occupation" y se utiliza la función "ROW_NUMBER()" 
para obtener el número de fila por cada "Occupation" y se almacena en la columna "rn". 
Luego se utiliza la función "MAX()" para obtener el valor de "Name" según el valor de "Occupation" y 
se agrupa por el valor de "rn" y se ordena por el valor de "rn".  Por lo que se consigue pivotar los datos en 4 columnas 
una para cada profesion.*/



SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) Actor
FROM (
    SELECT
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) rn
    FROM OCCUPATIONS
) subquery
GROUP BY rn
ORDER BY rn;