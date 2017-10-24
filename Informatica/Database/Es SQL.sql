
-- PERSONE CHE FANNO LO STESSO SPORT DI MIRKO MANZO.
select nome,cognome from persone, personesports 
		where idPersona = ksPersona and ksSport = any(select idSport from persone,sports,personesports
													WHERE idSport = ksSport and idPersona = ksPersona and 
													nome = 'Mirko' and cognome = 'Manzo') 
		and (nome != 'Mirko' or cognome != 'Manzo');