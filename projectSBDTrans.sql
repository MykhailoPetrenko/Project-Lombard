

DROP TABLE Sprzedaz;
DROP TABLE Pracownik;
DROP TABLE Przedmioty;
DROP TABLE Umowa;
DROP Table Klient;
DROP TABLE KategoriaP;

alter table przedmioty drop column zdjecie;
truncate table sprzedaz;

CREATE TABLE KategoriaP (
    IdKAtegorii integer  NOT NULL,
    NazwaKat varchar(20)  NOT NULL,
    CONSTRAINT KategoriaP_pk PRIMARY KEY (IdKAtegorii)
) ;

-- Table: Klient
CREATE TABLE Klient (
    IKlienta integer  NOT NULL,
    Imie varchar(10)  NOT NULL,
    Nazwisko varchar(20)  NOT NULL,
    MiejsceZamieszkania varchar(20)  NOT NULL,
    DataUrodzenia date  NOT NULL,
    NrPaszportu varchar(8)  NOT NULL,
    DataWydaniaPaszp date  NOT NULL,
    KimWydany varchar(20)  NOT NULL,
    TelefonKontakowy varchar(10)  NOT NULL,
    CONSTRAINT Klient_pk PRIMARY KEY (IKlienta)
) ;

-- Table: Pracownik
CREATE TABLE Pracownik (
    IdPracownika integer  NOT NULL,
    ImiePrac varchar(20)  NOT NULL,
    NazwiskoPrac varchar(30)  NOT NULL,
    Posada varchar(15)  NULL,
    Sal Integer  NOT NULL,
    CONSTRAINT Pracownik_pk PRIMARY KEY (IdPracownika)
) ;

-- Table: Przedmioty
CREATE TABLE Przedmioty (
    IdTowaru integer  NOT NULL,
    NazwaTowaru varchar(20)  NOT NULL,
    IloscTow varchar(10)  NOT NULL,
    Adnotacja varchar(50)  NOT NULL,
    OcenaWar Integer  NOT NULL,
    Status varchar(10)  NOT NULL,
    IdKAtegorii integer  NOT NULL,
    IdUmowy integer  NOT NULL,
    CONSTRAINT Przedmioty_pk PRIMARY KEY (IdTowaru)
) ;

-- Table: Sprzedaz
CREATE TABLE Sprzedaz (
    NrSpzedazu integer  NOT NULL,
    CenaSprz Integer  NOT NULL,
    DataSprz date  NOT NULL,
    IdPracownika integer  NOT NULL,
    IdTowaru integer  NOT NULL,
    ProcentZaSprz Integer  NOT NULL,
    CONSTRAINT Sprzedaz_pk PRIMARY KEY (NrSpzedazu)
) ;

-- Table: Umowa
CREATE TABLE Umowa (
    IdUmowy integer  NOT NULL,
    DataUmowy date  NOT NULL,
    MinCzasZestawu varchar(10)  NOT NULL,
    MaxCzasZestawu varchar(10)  NOT NULL,
    ProcentDzien integer  NOT NULL,
    FaktDataOdkupu date  NOT NULL,
    FaktSummaOdkupu integer  NOT NULL,
    IdKlienta integer  NOT NULL,
    CONSTRAINT Umowa_pk PRIMARY KEY (IdUmowy)
) ;


ALTER TABLE Przedmioty ADD CONSTRAINT PrzedmiotZastawu_Kategoria
    FOREIGN KEY (IdKAtegorii)
    REFERENCES KategoriaP (IdKAtegorii);


ALTER TABLE Przedmioty ADD CONSTRAINT PrzedmiotZastawu_Umowa
    FOREIGN KEY (IdUmowy)
    REFERENCES Umowa (IdUmowy);

ALTER TABLE Sprzedaz ADD CONSTRAINT Sprzedarz
    FOREIGN KEY (IdTowaru)
    REFERENCES Przedmioty (IdTowaru);

ALTER TABLE Sprzedaz ADD CONSTRAINT Sprzedaz_Pracownik
    FOREIGN KEY (IdPracownika)
    REFERENCES Pracownik (IdPracownika);

ALTER TABLE Umowa ADD CONSTRAINT Umowa_Klient
    FOREIGN KEY (IdKlienta)
    REFERENCES Klient (IKlienta);

--////////////////
INSERT INTO kategoriaP (idkategorii, nazwakat) VALUES (1, 'TECHNIKA');
INSERT INTO kategoriaP (idkategorii, nazwakat) VALUES (2, 'ZEGARKI');
INSERT INTO kategoriaP (idkategorii, nazwakat) VALUES (3, 'BIZUTERIA');
INSERT INTO kategoriaP (idkategorii, nazwakat) VALUES (4, 'ODZIERZ');

INSERT INTO klient (iklienta, imie, nazwisko, miejscezamieszkania, dataurodzenia, nrpaszportu, datawydaniapaszp, kimwydany, telefonkontakowy)
VALUES (1,'Symon', 'Prowel','Warszawa',GETDATE(),'FA5674',GETDATE(),'WKP','57523394');   
INSERT INTO klient (iklienta, imie, nazwisko, miejscezamieszkania, dataurodzenia, nrpaszportu, datawydaniapaszp, kimwydany, telefonkontakowy)
VALUES (2,'Pavel', 'Mardor','Warszawa',GETDATE(),'FA9086',GETDATE(),'PTR','589366409');    
INSERT INTO klient (iklienta, imie, nazwisko, miejscezamieszkania, dataurodzenia, nrpaszportu, datawydaniapaszp, kimwydany, telefonkontakowy)
VALUES (3,'Vlad', 'Borzek','Lublin',GETDATE(),'RF7463',GETDATE(),'USK','758499870');    
INSERT INTO klient (iklienta, imie, nazwisko, miejscezamieszkania, dataurodzenia, nrpaszportu, datawydaniapaszp, kimwydany, telefonkontakowy)
VALUES (4,'Symon', 'Prowel','Warszawa',GETDATE(),'FA5674',GETDATE(),'WKP','854399432');    
INSERT INTO klient (iklienta, imie, nazwisko, miejscezamieszkania, dataurodzenia, nrpaszportu, datawydaniapaszp, kimwydany, telefonkontakowy)
VALUES (5,'Kasper', 'Wajga','Warszawa',GETDATE(),'KP8321',GETDATE(),'USK','943744837'); 
INSERT INTO klient (iklienta, imie, nazwisko, miejscezamieszkania, dataurodzenia, nrpaszportu, datawydaniapaszp, kimwydany, telefonkontakowy)
VALUES (6,'Kasper', 'Wajga','Warszawa',GETDATE(),'PK8493',GETDATE(),'USK','832733640');    
SELECT * FROM KLIENT;

INSERT INTO pracownik(idpracownika, imieprac, nazwiskoprac, posada, sal)
VALUES (1,'Karol', 'Terol', 'pracownik',999 );
INSERT INTO pracownik(idpracownika, imieprac, nazwiskoprac, posada, sal)
VALUES (2,'Misha', 'Gorkusza', 'pracownik',3200);
INSERT INTO pracownik(idpracownika, imieprac, nazwiskoprac, posada, sal)
VALUES (3,'Vlodymir', 'Czapa', 'pracownik',3100);
INSERT INTO pracownik(idpracownika, imieprac, nazwiskoprac, posada, sal)
VALUES (4,'Sergo', 'Gorelow', 'pracownik',3500);
INSERT INTO pracownik(idpracownika, imieprac, nazwiskoprac, posada, sal)
VALUES (5,'Karol', 'Tupow', 'pracownik', 3400);

INSERT INTO umowa (idumowy, dataumowy, minczaszestawu, maxczaszestawu, procentdzien, faktdataodkupu, faktsummaodkupu, idklienta)
VALUES (1, GETDATE(), '3 dni', 'tygoden', 0.25, GETDATE(), 950, 1);
INSERT INTO umowa (idumowy, dataumowy, minczaszestawu, maxczaszestawu, procentdzien, faktdataodkupu, faktsummaodkupu, idklienta)
VALUES (2, GETDATE(), '3 dni', 'tygoden', 0.33, GETDATE(), 250, 1);
INSERT INTO umowa (idumowy, dataumowy, minczaszestawu, maxczaszestawu, procentdzien, faktdataodkupu, faktsummaodkupu, idklienta)
VALUES (3, GETDATE(), '4 dni', 'tygoden', 0.17, GETDATE(), 550, 2);
INSERT INTO umowa (idumowy, dataumowy, minczaszestawu, maxczaszestawu, procentdzien, faktdataodkupu, faktsummaodkupu, idklienta)
VALUES (4, GETDATE(), '3 dni', 'tygoden', 0.55, GETDATE(), 170, 2);
INSERT INTO umowa (idumowy, dataumowy, minczaszestawu, maxczaszestawu, procentdzien, faktdataodkupu, faktsummaodkupu, idklienta)
VALUES (5, GETDATE(), '2 dni', 'tygoden', 0.89, GETDATE(), 220, 4);
INSERT INTO umowa (idumowy, dataumowy, minczaszestawu, maxczaszestawu, procentdzien, faktdataodkupu, faktsummaodkupu, idklienta)
VALUES (6, GETDATE(), '3 dni', 'tygoden', 0.89,GETDATE(), 344, 1);
INSERT INTO umowa (idumowy, dataumowy, minczaszestawu, maxczaszestawu, procentdzien, faktdataodkupu, faktsummaodkupu, idklienta)
VALUES (7, GETDATE(), '7 dni', 'dwa tyg', 0.25, GETDATE(), 299, 1);

INSERT INTO przedmioty (idtowaru, nazwatowaru,ilosctow, adnotacja,ocenawar,status, idkategorii, idumowy)
VALUES (1, 'Telewizor',2,'LG-72',890,'oczekiwa', 1, 1);
INSERT INTO przedmioty (idtowaru, nazwatowaru,ilosctow, adnotacja,ocenawar,status, idkategorii, idumowy)
VALUES (2, 'Telewizor',1,'Samsung',720,'oczekiwa', 1, 1);
INSERT INTO przedmioty (idtowaru, nazwatowaru,ilosctow, adnotacja,ocenawar,status, idkategorii, idumowy)
VALUES (3, 'Zegarki',2,'Rolex',990,'oczekiwa', 2, 1);
INSERT INTO przedmioty (idtowaru, nazwatowaru,ilosctow, adnotacja,ocenawar,status, idkategorii, idumowy)
VALUES (4, 'Komputer',5,'Asus',999,'oczekiwa', 1, 2);
INSERT INTO przedmioty (idtowaru, nazwatowaru,ilosctow, adnotacja,ocenawar,status, idkategorii, idumowy)
VALUES (5, 'Bluza',2,'Armani',210,'oczekiwa', 4, 6);
INSERT INTO przedmioty (idtowaru, nazwatowaru,ilosctow, adnotacja,ocenawar,status, idkategorii, idumowy)
VALUES (6, 'Zegarki',2,'G-SHOCK',220,'oczekiwa', 2, 6);
INSERT INTO przedmioty (idtowaru, nazwatowaru,ilosctow, adnotacja,ocenawar,status, idkategorii, idumowy)
VALUES (7, 'Telewizor',2,'LG-72',890,'oczekiwa', 1, 5);
INSERT INTO przedmioty (idtowaru, nazwatowaru,ilosctow, adnotacja,ocenawar,status, idkategorii, idumowy)
VALUES (8, 'Kolia',2,'szriablo',170,'oczekiwa', 3, 2);
INSERT INTO przedmioty (idtowaru, nazwatowaru,ilosctow, adnotacja,ocenawar,status, idkategorii, idumowy)
VALUES (9, 'Telefon',2,'IPhone 6',890,'oczekiwa', 1, 7);
INSERT INTO przedmioty (idtowaru, nazwatowaru,ilosctow, adnotacja,ocenawar,status, idkategorii, idumowy)
VALUES (10, 'Kamera',2,'G0-pro 5x',550,'oczekiwa', 1, 3);
INSERT INTO przedmioty (idtowaru, nazwatowaru,ilosctow, adnotacja,ocenawar,status, idkategorii, idumowy)
VALUES (11, 'Kolia',2,'Zloto',303,'oczekiwa', 3, 3);
INSERT INTO przedmioty (idtowaru, nazwatowaru,ilosctow, adnotacja,ocenawar,status, idkategorii, idumowy)
VALUES (12, 'Spodenki',2,'Armani',300,'oczekiwa', 4, 3);
INSERT INTO przedmioty (idtowaru, nazwatowaru,ilosctow, adnotacja,ocenawar,status, idkategorii, idumowy)
VALUES (13, 'Narzyjnik',2,'Zloto',420,'oczekiwa', 3, 3);

INSERT INTO sprzedaz(nrspzedazu, cenasprz, datasprz, idpracownika, idtowaru, procentzasprz)
VALUES (1,270,GETDATE(), 1, 1,0.05);
INSERT INTO sprzedaz(nrspzedazu, cenasprz, datasprz, idpracownika, idtowaru, procentzasprz)
VALUES (2,420,GETDATE(), 2, 2,0.04);
INSERT INTO sprzedaz(nrspzedazu, cenasprz, datasprz, idpracownika, idtowaru, procentzasprz)
VALUES (3,360,GETDATE(), 1, 2,0.03);
INSERT INTO sprzedaz(nrspzedazu, cenasprz, datasprz, idpracownika, idtowaru, procentzasprz)
VALUES (4,820,GETDATE(), 3, 5,0.08);
INSERT INTO sprzedaz(nrspzedazu, cenasprz, datasprz, idpracownika, idtowaru, procentzasprz)
VALUES (5,233,GETDATE(), 5, 6,0.09);
INSERT INTO sprzedaz(nrspzedazu, cenasprz, datasprz, idpracownika, idtowaru, procentzasprz)
VALUES (6,820,GETDATE(), 3, 7,0.08);
INSERT INTO sprzedaz(nrspzedazu, cenasprz, datasprz, idpracownika, idtowaru, procentzasprz)
VALUES (7,820,GETDATE(), 2, 9,0.05);
INSERT INTO sprzedaz(nrspzedazu, cenasprz, datasprz, idpracownika, idtowaru, procentzasprz)
VALUES (8,500,GETDATE(), 1, 10,0.03);
INSERT INTO sprzedaz(nrspzedazu, cenasprz, datasprz, idpracownika, idtowaru, procentzasprz)
VALUES (9,270,GETDATE(), 1, 11,0.05);
INSERT INTO sprzedaz(nrspzedazu, cenasprz, datasprz, idpracownika, idtowaru, procentzasprz)
VALUES (10,270,GETDATE(), 2, 6,0.03);


UPDATE przedmioty SET ilosctow =3 WHERE ocenawar= 550;
UPDATE przedmioty SET ilosctow =1 WHERE ocenawar>  600;
UPDATE przedmioty SET ilosctow =4 WHERE ocenawar= 300;
UPDATE przedmioty SET ilosctow =0 WHERE ocenawar= 170;
UPDATE przedmioty SET ilosctow =3 WHERE ocenawar= 550;


--procedure:

ALTER PROC powyzka @idprac Varchar
AS
DECLARE  zCur CURSOR FOR SELECT Count(1) FROM Pracownik p JOIN Sprzedaz s ON
							p.IdPracownika=s.IdPracownika WHERE s.IdPracownika = @idprac
DECLARE @ile Int, @imiepracNaz Varchar(20)
BEGIN
OPEN zCur
	BEGIN
	FETCH NEXT FROM zCur INTO @ile	
	WHILE @@FETCH_STATUS = 0
		BEGIN
			SELECT @imiepracNaz = imieprac + ' ' + nazwiskoprac
			FROM Pracownik
			WHERE IdPracownika = @idprac
				PRINT ' ' + Cast(@ile AS VARCHAR)
			IF @ile >2 
			BEGIN
				UPDATE Pracownik Set Sal = sal + (sal*0.1) WHERE IdPracownika = @idprac
				PRINT 'Podwyzku dostal: ' + @imiepracNaz + ' na 10 proc'
				FETCH NEXT FROM zCur INTO @ile
			END
		END
	CLOSE zCur;
	deallocate zCur;
	END
END

EXECUTE powyzka 1



ALTER PROC procTwoMy @idtowaru Varchar, @ile INT
AS
DECLARE curs CURSOR FOR SELECT NazwaTowaru
						FRom Przedmioty
						WHERE IdTowaru = @idtowaru
--DECLARE @idOsoba INT, @placa Money , @ImieNazwisko VArchar(20), @info Varchar(50)
DECLARE @nazwatow Varchar(20)
OPEN curs
	BEGIN
			UPDATE Przedmioty SET IloscTow = IloscTow + @ile WHERE IdTowaru = @idtowaru
			PRINT 'Towar ' + @nazwatow + ' zwiekszona na ' + Cast(@ile AS VARCHAR)
	END
CLOSE curs;
deallocate curs;


EXECUTE procTwoMy 2, 2;
SELECT * FROM Przedmioty;
UPDATE Przedmioty SET iloscTow = 1 WHERE IdTowaru = 2;
rollback

--nie pozwala usuac pracownika o posadzie - dyrector
ALTER TRIGGER onTab ON pracownik FOR DELETE
AS
BEGIN
	DECLARE @sal INT, @idpracownika INT, @imieprac Varchar(20), @nazwiskoprac Varchar(20), @posada Varchar(20)
	SELECT @sal = sal, @posada = posada, @idpracownika = IdPracownika, @idpracownika = ImiePrac FROM deleted
	IF @sal > 3000 OR @posada = 'dyrector'
	BEGIN
		INSERT INTO Pracownik Values(@idpracownika, @imieprac, @nazwiskoprac, @posada, @sal);
	END
END
INSERT INTO pracownik(idpracownika, imieprac, nazwiskoprac, posada, sal)
VALUES (1,'Karol', 'Terol', 'pracownik',999 );
DELETE FROM Pracownik WHERE IdPracownika = 1;