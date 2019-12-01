create table stan_zamowienia
(
    id    int  not null,
    nazwa text not null,
    constraint stan_zamowienia_id_uindex
        unique (id)
);

alter table stan_zamowienia
    add primary key (id);

INSERT INTO shop.stan_zamowienia (id, nazwa) VALUES (1, 'NIEZATWIERDZONE');
INSERT INTO shop.stan_zamowienia (id, nazwa) VALUES (2, 'ZATWIERDZONE');
INSERT INTO shop.stan_zamowienia (id, nazwa) VALUES (3, 'ANULOWANE');
INSERT INTO shop.stan_zamowienia (id, nazwa) VALUES (4, 'ZREALIZOWANE');