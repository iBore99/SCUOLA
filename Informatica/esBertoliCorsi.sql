CREATE DATABASE IF NOT EXISTS accademia;

CREATE TABLE IF NOT EXISTS docenti(
    id_docente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    cognome VARCHAR(25),
    nome VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS studenti(
    matricola CHAR(5) PRIMARY KEY NOT NULL,
    cognome VARCHAR(25),
    nome VARCHAR(25),
    data_nascita DATE,
    indirizzo VARCHAR(25),
    citta VARCHAR(25),
    email VARCHAR(30),
    cellulare VARCHAR(20)
); 


CREATE TABLE IF NOT EXISTS  corsi(
    cod_corso CHAR(2) PRIMARY KEY NOT NULL,
    id_docente INT NOT NULL,
    titolo VARCHAR(25),
    ore INT,
    num_esami INT,
    data_inizio_validita DATE,
    data_fine_validita DATE,

    FOREIGN KEY (id_docente) REFERENCES docenti(id_docente)
);

CREATE TABLE IF NOT EXISTS esami(
    id_esame INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cod_corso CHAR(2) NOT NULL,
    matricola CHAR(5) NOT NULL,
    voto INT,
    superato CHAR(1) DEFAULT 'N',
    data_esame DATE,
 

    FOREIGN KEY (cod_corso) REFERENCES corsi(cod_corso), 
    FOREIGN KEY (matricola) REFERENCES studenti(matricola)
);



CREATE TABLE IF NOT EXISTS iscrizioni(
    id_iscrizione INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cod_corso CHAR(2) NOT NULL,
    matricola CHAR(5) NOT NULL,
    data_iscrizione DATE,
    importo DECIMAL(8,2),
    superato CHAR(1),
    voto_finale INT,

    

    FOREIGN KEY (cod_corso) REFERENCES corsi(cod_corso), 
    FOREIGN KEY (matricola) REFERENCES studenti(matricola)
);



a) SELECT DISTINCT s.nome FROM studenti s JOIN iscrizioni i ON s.matricola = i.matricola JOIN corsi c ON i.cod_corso = c.cod_corso WHERE c.cod_corso <> "57";

b) SELECT  e.data_esame, e.voto FROM studenti s JOIN esami e ON s.matricola = e.matricola JOIN corsi c ON e.cod_corso = "57" AND c.data_inizio_validita = "2016-11-11" WHERE e.superato = "S";

3) SELECT c.titolo, COUNT(*) as "N. studenti partecipanti" FROM studenti s JOIN iscrizioni i ON s.matricola = i.matricola JOIN corsi c ON c.cod_corso = i.cod_corso WHERE c.data_inizio_validita LIKE "2016%" AND i.superato = "S";

4) SELECT s.nome, s.cognome, COUNT(*) AS [N. corsi] FROM studenti s, iscrizioni i, corsi c WHERE s.matricola = i.matricola AND i.cod_corso = c.cod_corso
    GROUP BY s.matricola ;