1) SELECT f.titolo, f.anno_produzione FROM (SELECT * FROM film f WHERE f.anno_produzione > 1960) f, recite r, attori a 
WHERE f.cod_film = r.cod_film AND r.cod_attore = a.cod_attore

2) DURATA??

3) SELECT f.titolo, f.genere FROM 
film f, 
(SELECT * FROM proiezioni p WHERE p.data_proiezione = '2014-12-25') P,
(SELECT * FROM sale s WHERE s.citta = 'Napoli') S 
    WHERE f.cod_film = P.cod_film AND P.cod_sala = S.cod_sala;


4) 
SELECT M.titolo FROM
(SELECT f.* FROM film f, recite r, 
(SELECT a.cod_attore FROM attori a WHERE a.nome = 'Marcello' AND a.cognome = 'Mastroiani') A
WHERE f.cod_film  = r.cod_film AND r.cod_attore = A.cod_attore) M,

(SELECT f.* FROM film f, recite r, 
(SELECT a.cod_attore FROM attori a WHERE a.nome = 'Sofia' AND a.cognome = 'Loren') A
WHERE f.cod_film  = r.cod_film AND r.cod_attore = A.cod_attore) S

WHERE M.cod_film = A.cod_film;


5)
SELECT f.titolo, A.cognome, A.nome FROM 
(SELECT * FROM attori a WHERE a.nazionalita = 'francese') A,
film f, recite r 
WHERE f.cod_film = r.cod_film AND A.cod_attore = r.cod_attore;


SELECT COUNT(*) AS "N. posti" FROM 
(SELECT * FROM sale s WHERE s.posti > 60) S;

