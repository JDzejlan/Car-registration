CREATE DATABASE RegistracijaAutomobila;

USE RegistracijaAutomobila;

CREATE TABLE Vlasnik (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Ime VARCHAR(50) NOT NULL,
    Prezime VARCHAR(50) NOT NULL,
    Adresa VARCHAR(100) NOT NULL,
    Telefon VARCHAR(20) NOT NULL
);

CREATE TABLE Vozilo (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    BrojRegistracije VARCHAR(20) UNIQUE NOT NULL,
    Model VARCHAR(50) NOT NULL,
    GodinaProizvodnje YEAR NOT NULL,
    Kategorija VARCHAR(50) NOT NULL,
    CijenaRegistracije DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Registracija (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    VoziloID INT NOT NULL,
    VlasnikID INT NOT NULL,
    DatumRegistracije DATE NOT NULL,
    DatumIsteka DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (VoziloID) REFERENCES Vozilo(ID), 
    FOREIGN KEY (VlasnikID) REFERENCES Vlasnik(ID) 
);

DELIMITER //

CREATE PROCEDURE PromjenaCijeneZaKategoriju(IN kategorija VARCHAR(50), IN novaCijena DECIMAL(10, 2))
BEGIN
    UPDATE Vozilo
    SET CijenaRegistracije = novaCijena
    WHERE Kategorija = kategorija;
END //

DELIMITER ;


INSERT INTO Vlasnik (Ime, Prezime, Adresa, Telefon)
VALUES
('Amar', 'Hadžić', 'Titova 1, Sarajevo', '061111111'),
('Nedim', 'Kovačević', 'Ferhadija 5, Sarajevo', '061222222'),
('Adnan', 'Omerović', 'Maršala Tita 15, Mostar', '061333333'),
('Zejtin', 'Karabegović', 'Zmaja od Bosne 10, Sarajevo', '061444444'),
('Haris', 'Delić', 'Bosanska 3, Tuzla', '061555555'),
('Nermin', 'Šarić', 'Kneza Mihaila 7, Banja Luka', '061666666'),
('Kenan', 'Muratović', 'Mehmeda Spahe 8, Zenica', '061777777'),
('Nedim', 'Hadžibegić', 'Trg Slobode 2, Tuzla', '061888888'),
('Muradif', 'Mahmutović', 'Grbavica 2, Sarajevo', '061999999'),
('Emir', 'Salihović', 'Bulevar Revolucije 4, Mostar', '062000000');
INSERT INTO Vlasnik (Ime, Prezime, Adresa, Telefon)
VALUES
('Džemil', 'Mehić', 'Irac 1, Tuzla', '062111111'),
('Muhamed', 'Hodžić', 'Irac 2, Tuzla', '062222222');


INSERT INTO Vozilo (BrojRegistracije, Model, GodinaProizvodnje, Kategorija, CijenaRegistracije)
VALUES
('A11-AAA', 'Volkswagen Golf', 2015, 'Putničko', 150.00),
('A22-BBB', 'Toyota Corolla', 2018, 'Putničko', 180.00),
('A33-CCC', 'Audi A4', 2017, 'Putničko', 200.00),
('A44-DDD', 'Mercedes C-Class', 2016, 'Putničko', 220.00),
('A55-EEE', 'Skoda Octavia', 2019, 'Putničko', 190.00),
('A66-FFF', 'BMW 3 Series', 2015, 'Putničko', 210.00),
('A77-GGG', 'Renault Clio', 2018, 'Putničko', 160.00),
('A88-HHH', 'Ford Focus', 2016, 'Putničko', 170.00),
('A99-III', 'Opel Astra', 2017, 'Putničko', 175.00),
('A10-JJJ', 'Peugeot 308', 2019, 'Putničko', 185.00);
INSERT INTO Vozilo (BrojRegistracije, Model, GodinaProizvodnje, Kategorija, CijenaRegistracije)
VALUES
('A12-AAA', 'Volkswagen Polo', 2016, 'Putničko', 160.00),
('A13-BBB', 'Toyota Yaris', 2019, 'Putničko', 190.00);
INSERT INTO Vozilo (BrojRegistracije, Model, GodinaProizvodnje, Kategorija, CijenaRegistracije)
VALUES ('A16-EEE', 'Renault Megane', 2017, 'Putničko', 170.00);



INSERT INTO Registracija (VoziloID, VlasnikID, DatumRegistracije, DatumIsteka, Status)
VALUES
(1, 1, '2024-01-15', '2025-01-15', 'Aktivna'),
(2, 2, '2024-02-20', '2025-02-20', 'Aktivna'),
(3, 3, '2024-03-10', '2025-03-10', 'Aktivna'),
(4, 4, '2024-04-25', '2025-04-25', 'Aktivna'),
(5, 5, '2024-05-05', '2025-05-05', 'Aktivna'),
(6, 6, '2024-06-15', '2025-06-15', 'Aktivna'),
(7, 7, '2024-07-20', '2025-07-20', 'Aktivna'),
(8, 8, '2024-08-30', '2025-08-30', 'Aktivna'),
(9, 9, '2024-09-15', '2025-09-15', 'Aktivna'),
(10, 10, '2024-10-25', '2025-10-25', 'Aktivna');
INSERT INTO Registracija (VoziloID, VlasnikID, DatumRegistracije, DatumIsteka, Status)
VALUES
(11, 11, '2023-01-15', '2024-01-15', 'Neaktivna'),
(12, 12, '2023-02-20', '2024-02-20', 'Neaktivna');
INSERT INTO Registracija (VoziloID, VlasnikID, DatumRegistracije, DatumIsteka, Status)
VALUES (1, 1, '2024-05-01', '2025-05-01', 'Aktivna');



SELECT Vlasnik.Ime, Vlasnik.Prezime, Vozilo.BrojRegistracije, Vozilo.Model, Vozilo.GodinaProizvodnje
FROM Vlasnik
JOIN Registracija ON Vlasnik.ID = Registracija.VlasnikID
JOIN Vozilo ON Registracija.VoziloID = Vozilo.ID;

INSERT INTO Vlasnik (Ime, Prezime, Adresa, Telefon)
VALUES ('Meho', 'Kekić', 'Irac, Tuzla', '062123456');



UPDATE Vlasnik
SET Adresa = 'Grbavica, Sarajevo'
WHERE ID = 1;


DELETE FROM Vozilo
WHERE ID = 1;


SELECT Vlasnik.Ime, Vlasnik.Prezime, Vozilo.BrojRegistracije, Registracija.DatumRegistracije, Registracija.DatumIsteka
FROM Registracija
JOIN Vlasnik ON Registracija.VlasnikID = Vlasnik.ID
JOIN Vozilo ON Registracija.VoziloID = Vozilo.ID
WHERE Registracija.Status = 'Aktivna';



UPDATE Vozilo
SET CijenaRegistracije = CijenaRegistracije * 1.20
WHERE Kategorija = 'Putničko';


SELECT Vlasnik.Ime, Vlasnik.Prezime, COUNT(Registracija.VoziloID) AS BrojVozila
FROM Vlasnik
JOIN Registracija ON Vlasnik.ID = Registracija.VlasnikID
GROUP BY Vlasnik.ID, Vlasnik.Ime, Vlasnik.Prezime
HAVING COUNT(Registracija.VoziloID) > 1;





