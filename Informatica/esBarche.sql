/*
a) Elenco delle barche che hanno partecipato a TUTTE le regate
b) Elenco delle barche che hanno più di uno sponsor
c) Elenco delle barche che hanno partecipato alla regata di Bergen ma NON a quella di Melbourne
*/

/* a */

SELECT b.* FROM barche b, partecipa p, regate r
WHERE b.cod_barca = p.cod_barca AND p.cod_regata = r.cod_regata
GROUP BY b.cod_barca HAVING COUNT(*) = (SELECT COUNT(*) FROM regate);


/* b */

SELECT b.*, COUNT(*) AS "N. Sponsor" FROM barche b, sponsor s WHERE b.cod_barca = s.cod_barca
GROUP BY b.cod_barca HAVING COUNT(*) >= 2;


/* c */

SELECT M.* FROM ( SELECT * from barche
    WHERE cod_barca NOT IN (  
        SELECT p.cod_barca 
        FROM partecipa p, regate r
        WHERE p.cod_regata = r.cod_regata	
        AND r.luogo = 'Melbourne'
) ) M,
 ( 	SELECT b.cod_barca, b.nome, b.nazionalita 
	FROM barche b, partecipa p, regate r
	WHERE b.cod_barca = p.cod_barca AND p.cod_regata = r.cod_regata
	AND r.luogo = 'Bergen' )  B 

	WHERE M.cod_barca = B.cod_barca


