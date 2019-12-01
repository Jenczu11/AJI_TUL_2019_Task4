create table zamowienie
(
    id                 int auto_increment
        primary key,
    data_zatwierdzenia date null,
    stan_zamowienia    int  not null,
    nazwa_uzytkownika  text not null,
    email              text not null,
    numer_telefonu     text not null,
    constraint zamowienie_stan_zamowienia_id_fk
        foreign key (stan_zamowienia) references stan_zamowienia (id)
);

