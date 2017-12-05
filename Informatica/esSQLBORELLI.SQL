--1) 
SELECT f.titolo, f.anno_produzione FROM (SELECT * FROM film f WHERE f.anno_produzione > 1960) f, recite r, attori a 
WHERE f.cod_film = r.cod_film AND r.cod_attore = a.cod_attore

-- Supponendo che "durata" sia un attributo dei "film"
--2) 

--3) 
SELECT f.titolo, f.genere FROM 
film f, 
(SELECT * FROM proiezioni p WHERE p.data_proiezione = '2014-12-25') P,
(SELECT * FROM sale s WHERE s.citta = 'Napoli') S 
    WHERE f.cod_film = P.cod_film AND P.cod_sala = S.cod_sala;


--4) 
SELECT M.titolo FROM
(SELECT f.* 
    FROM film f, 
    recite r, 
    (SELECT a.cod_attore FROM attori a WHERE a.nome = 'Marcello' AND a.cognome = 'Mastroiani') A
WHERE f.cod_film  = r.cod_film AND r.cod_attore = A.cod_attore) M,

(SELECT f.* 
    FROM film f, 
    recite r, 
    (SELECT a.cod_attore FROM attori a WHERE a.nome = 'Sofia' AND a.cognome = 'Loren') A
    WHERE f.cod_film  = r.cod_film AND r.cod_attore = A.cod_attore) S
WHERE M.cod_film = A.cod_film;


--5)
SELECT f.titolo, A.cognome, A.nome FROM 
(SELECT * FROM attori a WHERE a.nazionalita = 'francese') A,
film f, recite r 
WHERE f.cod_film = r.cod_film AND A.cod_attore = r.cod_attore;


--6) 
SELECT nome, COUNT(*) AS "N. sale" FROM sale WHERE citta = 'Firenze' AND posti > 60 GROUP BY nome 


--7) 
SELECT a.cognome, a.nome FROM attori a, recite r, film f
WHERE a.cod_attore = r.cod_attore AND r.cod_film = f.cod_film
AND r.cod_film NOT IN (SELECT cod_film FROM film WHERE regista = 'Spielberg');


--8)
SELECT citta FROM sale GROUP BY citta HAVING COUNT(*) > 10;    


--9)
SELECT F.titolo, COUNT(*), SUM(P.incasso) as IncassoTot FROM
    (SELECT * FROM film WHERE regista = "Spielberg")  F
LEFT JOIN 
    (SELECT * FROM proiezioni p, sale s WHERE p.cod_sala = s.cod_sala AND s.citta = "Firenze") P
ON F.cod_film = P.cod_film;
GROUP BY F.titolo;


--10) 
SELECT f.titolo, f.regista FROM film f, (SELECT cod_film FROM recite) R
WHERE f.cod_film NOT IN (R.cod_film);



