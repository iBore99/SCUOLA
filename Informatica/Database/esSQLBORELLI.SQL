1) SELECT f.titolo, f.anno_produzione FROM (SELECT * FROM film f WHERE f.anno_produzione > 1960) f, recite r, attori a 
WHERE f.cod_film = r.cod_film AND r.cod_attore = a.cod_attore

