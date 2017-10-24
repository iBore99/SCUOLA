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
------------------------------------------------------------------

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
