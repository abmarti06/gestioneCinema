CREATE TABLE Cinema (
CinemaID INT PRIMARY KEY,
nome VARCHAR(250) NOT NULL,
indirizzo VARCHAR(250) NOT NULL,
telefono VARCHAR(20)
);
CREATE TABLE Sala (
SalaID INT PRIMARY KEY,
CinemaRIF INT,
nome VARCHAR(50) NOT NULL,
capacità INT NOT NULL,
tipoSchermo VARCHAR(50),
FOREIGN KEY (CinemaRIF) REFERENCES Cinema(CinemaID)
);
CREATE TABLE Film (
FilmID INT PRIMARY KEY,
Titolo VARCHAR(255) NOT NULL,
Director VARCHAR(100),
DataRilascio DATE,
Durata INT,
Valutazione VARCHAR(5)
);

CREATE TABLE OrarioSpettacolo (
OrarioSpettacoloID INT PRIMARY KEY,
FilmRIF INT,
SalaRIF INT,
DataOra DATETIME NOT NULL,
Prezzo DECIMAL(5,2) NOT NULL,
FOREIGN KEY (FilmRIF) REFERENCES Film(FilmID),
FOREIGN KEY (SalaRIF) REFERENCES Sala(SalaID)
);

CREATE TABLE Cliente(
ClienteID INT PRIMARY KEY,
Nome VARCHAR(50) NOT NULL,
Cognome VARCHAR(50) NOT NULL,
Email VARCHAR(100),
Cellulare VARCHAR(20)
);

CREATE TABLE Biglietto (
BigliettoID INT PRIMARY KEY,
OrarioSpettacoloRIF INT,
Posto VARCHAR(10) NOT NULL,
AcquistoGiorno DATETIME NOT NULL,
ClienteRIF INT,
FOREIGN KEY (OrarioSpettacoloRIF) REFERENCES OrarioSpettacolo(OrarioSpettacoloID),
FOREIGN KEY (ClienteRIF) REFERENCES Cliente(ClienteID)
);
CREATE TABLE Revisione (
RevisioneID INT PRIMARY KEY,
FilmRIF INT,
ClienteRIF INT,
Revisionetesto TEXT,
Valutazione INT CHECK (Valutazione >= 1 AND Valutazione <= 5),
DataRevisione DATETIME NOT NULL,
FOREIGN KEY (FilmRIF) REFERENCES Film(FilmID),
FOREIGN KEY (ClienteRIF) REFERENCES Cliente(ClienteID)
);
CREATE TABLE Dipendente (
DipendenteID INT PRIMARY KEY,
CinemaRIF INT,
Nome VARCHAR(50) NOT NULL,
Cognome VARCHAR(50) NOT NULL,
Ruolo VARCHAR(50),
DataAssunzione DATE,
FOREIGN KEY (CinemaRIF) REFERENCES Cinema(CinemaID)
);

