COMANDI SQL:
 
Per fare delle condizioni:

-- Il contenuto del campo deve essere uguale al valore cercato (possono essere usati tutti gli op. relazionari).
WHERE nome_campo = val_cercato
EX: WHERE idUtente = 11;
   
-- La condizione è verificata se il valore del campo è uguale ad uno dei valori dentro le parentesi.
WHERE nome_campo IN ('val_campo_elem1', 'val_campo_elem2', ...)
EX: WHERE cognome IN ('rossi', 'Borelli')

-- La condizione è verificata quando una delle righe della tabella data come risultato dalle parentesi corrisponde all'uguaglianza.
WHERE nome_campo = ANY ("condizione");
Per concatenare delle condizioni sono presenti gli operatori logici AND, OR, NOT. 
------------------------------------------------------------------------------------------------------------------------------

Per creare un database:  CREATE DATABASE nome_database;
Per eliminare un database:  DROP DATABASE nome_database;

Per creare una tabella: CREATE TABLE nome_tabella( campo1 TIPO, campo2 TIPO ...);
per eliminare una tabella: DROP TABLE nome_tabella;

Per aggiungere un campo alla tabella: ALTER TABLE nome_tabella ADD nome_campo1 TIPO1, nome_campo2 TIPO2 ...;
Per eliminare un campo della tabella: ALTER TABLE nome_tabella DROP nome_campo1, nome_campo2;

Per aggiungere un indice ad un campo della tabella: ALTER TABLE nome_tabella ADD INDEX (nome_campo);
Per eliminare un indice ad un campo della tabella: ALTER TABLE nome_tabella DROP INDEX nome_campo;

Per aggiungere un elemento ad una tabella: 
	INSERT INTO nome_tabella (nome_campo1, nome_campo2) VALUES (val_campo1, val_campo2,...);

Per modificare il valore di un campo: 
	UPDATE nome_tabella SET nome_campo_da_cambiare = nuovo_val_campo WHERE ""CONDIZIONE""

Per eliminare righe da una tabella: 
	DELETE FROM nome_tabella WHERE ""CONDIZIONE""
-------------------------------------------------------------------
DIVERSI TIPI DI SINTASSI:
1) SELECT c.nome FROM Clienti c JOIN Acquisti a ON c.codice_cliente = a.codice_cliente JOIN Fornitori f 
	ON a.codice_fornitore = f.codice_fornitore 
	WHERE f.nome = c.nome = 'Rossi' AND c.citta = 'Milano' ORDER BY c.nome;

2) SELECT c.nome FROM Clienti c, Acquisti a, Fornitori f 
	WHERE c.codice_cliente = a.codice_cliente AND f.codice_fornitore = a.codice_fornitore 
	ORDER BY c.nome;
	
----------------------------------------------------------------------
FUNZIONI DI RAGGRUPPAMENTO: 

1) COUNT() --> conta i record di una tabella.
2) SUM()   --> Somma i record di una tabella
3) MAX()   --> Restituisce il massimo
4) MIN()   --> Restituisce il minimo
5) AVG()   --> Restituisce la media

CLAUSOLE: 
GROUP BY
HAVING --> non può esistere senza "group by".

Esempi: 
1) SELECT COUNT(*) AS num_rec FROM Customers;

Quanti clienti ho per ogni nazione?

2) SELECT c.country, COUNT(*) AS [Num. Clienti] 
FROM Customers c 
GROUP BY c.country 
ORDER BY COUNT(*) DESC;

3) SELECT e.lastname, e.firstname, COUNT(*) AS [num ordini] 
FROM Employees e, Orders o 
WHERE e.employeeID = o.employeeid
GROUP BY e.employeeid HAVING COUNT(*) > 20
ORDER BY COUNT(*) DESC ;     

4) SELECT productName, price
FROM Products 
WHERE price > (SELECT AVG(PRICE) FROM PRODUCTS);

5) SELECT c.customername, o.orderdate, SUM(p.price * od.quantity) as [costo tot ordini]
FROM Customers c, Orders o, Orderdetails od, Products p
WHERE c.customerid = o.customerid AND o.orderid = od.orderId AND od.productid = p.productid AND
c.customername like 'GROSELLA%' 
GROUP BY c.customername
