create table zamowienie_produkty
(
    id            int not null,
    id_zamowienia int not null,
    id_produktu   int not null,
    ilosc         int not null,
    constraint zamowienie_produkty_id_uindex
        unique (id),
    constraint zamowienie_produkty_produkty_id_fk
        foreign key (id_produktu) references produkty (id),
    constraint zamowienie_produkty_zamowienie_id_fk
        foreign key (id_zamowienia) references zamowienie (id)
);

alter table zamowienie_produkty
    add primary key (id);

