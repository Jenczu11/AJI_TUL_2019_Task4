create table kategoria
(
    id    int auto_increment
        primary key,
    nazwa text not null
);

INSERT INTO shop.kategoria (id, nazwa) VALUES (1, 'warzywa');
INSERT INTO shop.kategoria (id, nazwa) VALUES (2, 'mięso');
INSERT INTO shop.kategoria (id, nazwa) VALUES (3, 'produkty mleczarskie');