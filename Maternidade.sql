CREATE DATABASE Maternidade

GO
USE Maternidade

CREATE TABLE Mae (
idMae int NOT NULL IDENTITY(1001,1),
nome varchar(60) NOT NULL,
logradouroEnd varchar(100) NOT NULL,
numeroEnd int NOT NULL CHECK(numeroEnd >= 0),
cepEnd char(8) NOT NULL CHECK(LEN(cepEnd) = 8),
complementoEnd varchar(200) NOT NULL,
telefone char(10) NOT NULL CHECK(LEN(telefone) = 10),
dataNasc date NOT NULL
PRIMARY KEY(idMae)
)

CREATE TABLE Bebe (
idBebe int NOT NULL IDENTITY(1,1),
nome varchar(60) NOT NULL,
dataNasc date DEFAULT GETDATE(),
altura decimal(7,2) NOT NULL CHECK(altura >= 0.0),
peso decimal(4,3) NOT NULL CHECK(peso >= 0.0),
maeIdMae int NOT NULL
PRIMARY KEY(idBebe)
FOREIGN KEY(maeIdMae) REFERENCES Mae(idMae)
)

CREATE TABLE Medico (
crmNumero int NOT NULL,
crmUf char(2) NOT NULL,
nome varchar(60) NOT NULL,
telefoneCelular char(11) NOT NULL UNIQUE CHECK(LEN(telefoneCelular) = 11),
especialidade varchar(30) NOT NULL
PRIMARY KEY(crmNumero, crmUf),
)

CREATE TABLE BebeMedico (
bebeIdBebe int NOT NULL,
medicoCrmNumero int NOT NULL,
medicoCrmUf char(2) NOT NULL
PRIMARY KEY(bebeIdBebe, medicoCrmNumero, medicoCrmUf),
FOREIGN KEY(bebeIdBebe) REFERENCES Bebe(idBebe),
FOREIGN KEY(medicoCrmNumero, medicoCrmUf) REFERENCES Medico(crmNumero, crmUf)
)