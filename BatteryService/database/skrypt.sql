create table baterie
(
id_baterii number primary key,
ilosc number(9)
)

create table urzadzenia
(
id_urzadzenia number primary key,
id_baterii number,
nr_identyfikacyjny number(9),
foreign key (id_baterii) references baterie(id_baterii)
)

create table status(
id_status number primary key,
status varchar(40)
)

CREATE table kategorie(
id_kategoria number primary key,
kategoria varchar(30)
)

create table pracownicy
(
id_pracownik number primary key,
login varchar(20),
haslo varchar(25)
)

create table klienci
(
id_klient number primary key,
imie varchar(20),
nazwisko varchar(30),
nr_telefonu number(12)
)

create table reklamacje
(
id_reklamacji number primary key,
id_klient number,
id_pracownik number,
id_kategoria number,
id_urzadzenia number,
id_status number,
opis_uszkodzenia varchar(150),
foreign key (id_pracownik) references pracownicy(id_pracownik),
foreign key (id_klient) references klienci(id_klient),
foreign key (id_kategoria) references kategorie(id_kategoria),
foreign key (id_urzadzenia) references urzadzenia(id_urzadzenia),
foreign key (id_status) references status(id_status)
)



