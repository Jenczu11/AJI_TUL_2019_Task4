create table kategoria
(
    id    int auto_increment
        primary key,
    nazwa text not null
);

INSERT INTO shop.kategoria (id, nazwa) VALUES (1, 'warzywa');
INSERT INTO shop.kategoria (id, nazwa) VALUES (2, 'mięso');
INSERT INTO shop.kategoria (id, nazwa) VALUES (3, 'produkty mleczarskie');
create table produkty
(
    id               int auto_increment
        primary key,
    nazwa            text  not null,
    opis             text  not null,
    cena_jednostkowa float not null,
    waga_jednostkowa float not null,
    kategoria_towaru int   not null,
    constraint produkty_kategoria_id_fk
        foreign key (kategoria_towaru) references kategoria (id)
);

INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (1, 'Miechunka peruwiańska', 'excepteur ut id voluptate adipisicing', 8.6231, 9.8973, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (2, 'Kapusta warzywna brukselska', 'occaecat occaecat aliquip aute deserunt', 5.5451, 5.0751, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (3, 'Kapusta warzywna głowiasta', 'qui do nostrud ad consequat', 5.4893, 4.0561, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (4, 'Piżmian jadalny', 'esse aliquip ut sit nulla', 7.4287, 2.437, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (5, 'Roszpunka warzywna', 'sunt duis nisi esse nisi', 6.0735, 2.3437, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (6, 'Patison', 'sint anim anim amet reprehenderit', 9.5999, 1.0814, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (7, 'Miechunka pomidorowa', 'amet et commodo dolore exercitation', 4.3648, 6.9446, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (8, 'Sałata siewna', 'adipisicing qui aliqua Lorem ea', 4.0418, 8.3128, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (9, 'Papryka chili', 'mollit ut velit mollit enim', 4.6366, 4.9269, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (10, 'Ogórek melon', 'minim aliquip non cupidatat dolor', 3.7539, 3.8043, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (11, 'Soja warzywna', 'labore do cillum ut consequat', 3.1809, 6.6925, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (12, 'Pochrzyn skrzydlaty', 'culpa sunt in consequat sint', 7.3726, 1.3788, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (13, 'Groch zwyczajny', 'eu aliqua nulla minim ex', 9.8127, 7.4022, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (14, 'Kapusta warzywna włoska', 'culpa velit dolore incididunt aliquip', 8.1923, 5.1954, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (15, 'Soja transgeniczna', 'quis non ut amet id', 9.1673, 9.0055, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (16, 'Cebula zwyczajna', 'qui aliqua eiusmod velit mollit', 0.3036, 4.7342, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (17, 'Brokuł', 'enim nisi voluptate tempor excepteur', 8.3116, 3.1071, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (18, 'Pietruszka zwyczajna', 'adipisicing exercitation occaecat mollit in', 9.6118, 5.6773, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (19, 'Rabarbar kędzierzawy', 'eu laborum Lorem sunt sit', 5.3926, 2.7662, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (20, 'Kabaczek', 'ipsum culpa fugiat laborum quis', 2.0966, 6.3488, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (21, 'Piękny Jaś z Doliny Dunajca', 'aute dolor ex ex occaecat', 4.4618, 4.8907, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (22, 'Dynia zwyczajna', 'Lorem anim pariatur aliquip tempor', 2.6346, 3.2888, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (23, 'Dynia figolistna', 'excepteur aliquip sunt officia velit', 1.4203, 6.8478, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (24, 'Czyściec bulwiasty', 'in minim adipisicing ipsum aute', 5.9563, 5.1318, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (25, 'Trichosanthes cucumeroides', 'est elit pariatur fugiat sint', 6.8594, 5.6137, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (26, 'Arbuz zwyczajny', 'sit laborum sit anim fugiat', 5.4642, 3.8707, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (27, 'Kalarepa', 'non duis reprehenderit aliqua dolore', 2.9464, 7.7883, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (28, 'Kapusta właściwa pekińska', 'aliquip magna aliqua nisi esse', 9.0876, 7.0776, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (29, 'Bakłażan', 'do occaecat enim deserunt labore', 1.4659, 9.8405, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (30, 'Kolokazja jadalna', 'irure voluptate non tempor et', 8.1081, 7.6577, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (31, 'Trichosanthes cucumeroides', 'minim fugiat ad Lorem mollit', 4.236, 1.0998, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (32, 'Pietruszka zwyczajna', 'fugiat amet ipsum elit eiusmod', 0.0115, 7.697, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (33, 'Jarmuż', 'sint mollit nisi excepteur commodo', 1.6929, 5.1573, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (34, 'Kapusta warzywna włoska', 'occaecat aute cupidatat consectetur pariatur', 2.8764, 6.1709, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (35, 'Modrak morski', 'exercitation laborum nisi cupidatat ad', 9.525, 5.4856, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (36, 'Dynia figolistna', 'esse non nisi sunt eiusmod', 0.038, 4.5567, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (37, 'Gorczycznik wiosenny', 'consectetur Lorem enim nostrud occaecat', 7.5871, 7.6878, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (38, 'Karczoch hiszpański', 'aute qui veniam cupidatat excepteur', 7.8991, 6.6191, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (39, 'Rabarbar kędzierzawy', 'occaecat do veniam laborum voluptate', 4.2301, 1.6134, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (40, 'Brokuły z Torbole', 'aute eu eu anim Lorem', 3.9999, 9.8201, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (41, 'Arbuz zwyczajny', 'elit ad incididunt laboris velit', 5.3601, 6.1372, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (42, 'Gurdlina ogórkowata', 'in magna cillum cillum dolore', 4.8912, 4.9758, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (43, 'Kalarepa', 'excepteur ipsum mollit ex ea', 1.2318, 2.3878, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (44, 'Kozibród porolistny', 'Lorem nostrud excepteur consequat fugiat', 0.9296, 6.271, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (45, 'Żółtosocza strzałkowata', 'quis incididunt nostrud sint amet', 9.0187, 5.4127, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (46, 'Cebula cukrowa', 'est Lorem do dolor Lorem', 3.7936, 2.5089, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (47, 'Cykoria endywia', 'sint do dolore cillum cillum', 0.542, 7.441, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (48, 'Ogórek melon', 'officia voluptate fugiat laboris ad', 8.2158, 2.0211, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (49, 'Cukinia', 'proident veniam laboris dolor elit', 9.688, 5.2942, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (50, 'Trichosanthes cucumeroides', 'duis aliquip eu qui veniam', 4.4413, 4.8067, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (51, 'Miechunka peruwiańska', 'veniam ullamco pariatur commodo tempor', 3.7832, 3.0234, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (52, 'Cukinia', 'duis reprehenderit aliquip velit id', 8.6838, 4.5895, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (53, 'Kukurydza zwyczajna', 'fugiat nisi nisi anim culpa', 8.3231, 2.5352, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (54, 'Sałata rzymska', 'magna eu eiusmod reprehenderit qui', 7.559, 9.9789, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (55, 'Roszpunka warzywna', 'sit id adipisicing eu ut', 6.4149, 7.4812, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (56, 'Sałata dębolistna', 'labore mollit proident pariatur duis', 0.0505, 7.3471, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (57, 'Pietruszka zwyczajna', 'commodo culpa aute culpa nulla', 7.2205, 7.584, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (58, 'Marchew czarna', 'eiusmod nulla cillum proident ea', 2.7655, 8.6023, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (59, 'Kolczoch jadalny', 'officia id id pariatur elit', 8.4388, 6.3453, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (60, 'Burak zwyczajny', 'commodo et ipsum quis eiusmod', 1.5498, 8.3624, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (61, 'Kapusta warzywna głowiasta', 'excepteur dolore qui sint laborum', 8.87, 2.434, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (62, 'Selery zwyczajne', 'Lorem irure dolor sit pariatur', 8.0372, 8.4255, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (63, 'Fasola ostrolistna', 'pariatur fugiat irure non ipsum', 7.1363, 2.3529, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (64, 'Gorczycznik wiosenny', 'ullamco veniam consequat elit eu', 5.2245, 4.5036, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (65, 'Kalarepa', 'et exercitation amet cupidatat id', 9.735, 1.7332, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (66, 'Szczypiorek', 'pariatur commodo irure ipsum eiusmod', 4.8408, 2.4149, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (67, 'Cebula cukrowa', 'excepteur in minim exercitation proident', 0.1455, 7.5975, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (68, 'Kapusta warzywna głowiasta', 'excepteur veniam sunt ipsum culpa', 0.1719, 6.087, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (69, 'Szpinak warzywny', 'ea ex adipisicing veniam consequat', 4.2098, 8.1078, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (70, 'Dynia makaronowa', 'esse nisi non ipsum exercitation', 6.2505, 3.9813, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (71, 'Marek kucmerka', 'aliqua cupidatat duis anim proident', 2.8771, 1.1263, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (72, 'Fasola zwykła', 'aute voluptate eu ut nisi', 8.67, 9.7644, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (73, 'Pomidor zwyczajny', 'consequat cupidatat aute ex veniam', 9.2793, 2.0031, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (74, 'Rabarbar ogrodowy', 'laboris ex ea in eu', 8.3584, 2.7249, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (75, 'Czosnek niedźwiedzi', 'voluptate enim sint officia eu', 9.5838, 5.7851, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (76, 'Pochrzyn skrzydlaty', 'et tempor proident Lorem sunt', 9.768, 4.204, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (77, 'Papryka (kuchnia)', 'incididunt aliquip exercitation irure esse', 2.639, 3.0106, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (78, 'Patison', 'labore commodo in sunt proident', 2.4172, 4.435, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (79, 'Sałata siewna', 'mollit sint reprehenderit qui reprehenderit', 4.5164, 9.759, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (80, 'Rabarbar ogrodowy', 'amet ad dolor id ea', 9.0144, 2.2375, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (81, 'Jarmuż', 'minim et sit consectetur amet', 2.3705, 3.0722, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (82, 'Coccinia grandis', 'sit est enim minim incididunt', 6.2941, 6.0182, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (83, 'Czyściec bulwiasty', 'qui in quis cillum culpa', 3.3496, 3.5462, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (84, 'Endywia kędzierzawa', 'dolor nisi laboris amet consequat', 3.8828, 7.121, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (85, 'Piżmian jadalny', 'enim Lorem anim commodo incididunt', 8.9513, 1.9716, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (86, 'Sałata rzymska', 'Lorem ex eiusmod nisi dolore', 3.1076, 1.466, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (87, 'Fasola mungo', 'incididunt cupidatat veniam esse occaecat', 4.0295, 5.804, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (88, 'Kozibród porolistny', 'eiusmod est sit commodo quis', 5.1406, 3.8569, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (89, 'Papryka peperoni', 'reprehenderit nisi sunt do fugiat', 9.2967, 9.2837, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (90, 'Cebula cukrowa', 'tempor commodo elit qui in', 9.73, 6.7993, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (91, 'Ogórek siewny', 'Lorem consequat labore commodo anim', 0.0017, 5.7077, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (92, 'Sałata rzymska', 'eu commodo incididunt ad reprehenderit', 7.4807, 9.9272, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (93, 'Trętwian czterorożny', 'do magna est exercitation ex', 9.7642, 2.6605, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (94, 'Kapusta warzywna brukselska', 'et voluptate veniam ea consequat', 3.3507, 9.3303, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (95, 'Czyściec bulwiasty', 'consequat consequat veniam sint ut', 7.7319, 8.2935, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (96, 'Kukurydza cukrowa', 'esse cupidatat ut aute laboris', 4.2545, 8.3765, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (97, 'Rukiew wodna', 'excepteur ad proident ad velit', 8.3451, 6.1998, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (98, 'Marek kucmerka', 'aute labore nulla occaecat laborum', 2.7891, 6.308, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (99, 'Burak ćwikłowy', 'nostrud irure in sunt qui', 4.1759, 3.4406, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (100, 'Dynia piżmowa', 'in dolor tempor quis ad', 9.5776, 6.3586, 1);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (185, 'Wagyū', 'cupidatat irure consectetur sunt irure', 5.5082, 6.7541, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (186, 'Noga wieprzowa', 'qui fugiat tempor officia aliquip', 6.1898, 4.983, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (187, 'Świeże mięso', 'irure incididunt officia nisi irure', 3.2195, 7.5239, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (188, 'Filet (mięso)', 'exercitation et adipisicing ipsum do', 0.6123, 7.0143, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (189, 'Polędwica', 'ad elit sit labore aliquip', 4.465, 1.5297, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (190, 'Żabie udka', 'do laborum aute ad ut', 9.2584, 6.9032, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (191, 'Głowizna', 'voluptate ipsum incididunt labore incididunt', 0.6227, 9.1844, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (192, 'Boczek', 'in non cupidatat reprehenderit nostrud', 1.0086, 3.6504, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (193, 'Golonka', 'et veniam irure commodo ex', 0.5506, 6.0182, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (194, 'Mięso oddzielane mechanicznie', 'veniam fugiat adipisicing velit et', 1.8661, 3.7674, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (195, 'Polędwiczka', 'in commodo duis non minim', 4.8002, 2.2238, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (196, 'Podgardle (mięso)', 'irure quis esse commodo laboris', 5.7712, 2.649, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (197, 'Mięso mielone', 'dolore nisi duis in culpa', 4.4464, 4.656, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (198, 'Dziczyzna', 'culpa fugiat laborum cillum sunt', 3.8795, 2.7708, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (199, 'Bushmeat', 'enim deserunt est anim ad', 6.1179, 4.0951, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (200, 'Wieprzowina', 'non eu dolor et veniam', 5.8684, 9.4181, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (201, 'Wieprzowina', 'duis ullamco incididunt ut laboris', 1.5689, 3.874, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (202, 'Tusza', 'in duis irure exercitation officia', 4.1297, 5.2401, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (203, 'Baranina', 'dolor amet commodo mollit minim', 3.1835, 2.1194, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (204, 'Wyroby mięsne', 'qui veniam sunt consequat non', 5.552, 4.6496, 2);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (205, 'Kumys', 'nostrud mollit et pariatur labore', 8.5735, 1.5949, 3);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (206, 'Mleko acidofilne', 'minim sunt incididunt id esse', 6.3871, 5.2866, 3);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (207, 'Wyroby seropodobne', 'ea pariatur commodo excepteur cupidatat', 0.5346, 2.8293, 3);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (208, 'Ajran', 'dolor quis cupidatat commodo minim', 9.8637, 3.1697, 3);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (209, 'Serwatka', 'occaecat nisi esse culpa proident', 4.1815, 4.1194, 3);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (210, 'Śmietana', 'elit amet proident id duis', 9.0617, 1.0601, 3);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (211, 'Clotted cream', 'sit consectetur esse non aliquip', 6.9452, 3.3344, 3);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (212, 'Ajran', 'aliquip esse consectetur adipisicing consequat', 6.1585, 1.5536, 3);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (213, 'Śmietana', 'ex voluptate occaecat ullamco dolore', 3.759, 1.4697, 3);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (214, 'Wyroby seropodobne', 'adipisicing Lorem eu aute aute', 8.2504, 1.1136, 3);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (215, 'Śmietana', 'nisi Lorem eu officia minim', 1.6014, 2.8661, 3);
INSERT INTO shop.produkty (id, nazwa, opis, cena_jednostkowa, waga_jednostkowa, kategoria_towaru) VALUES (216, 'Zaktualizowany Nowy Produkt', 'Nowy Produkt', 6, 2, 1);
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

INSERT INTO shop.zamowienie (id, data_zatwierdzenia, stan_zamowienia, nazwa_uzytkownika, email, numer_telefonu) VALUES (1, '2019-12-01', 3, 'Jan Kowalski', 'kowal@wp.pl', '123456789');
INSERT INTO shop.zamowienie (id, data_zatwierdzenia, stan_zamowienia, nazwa_uzytkownika, email, numer_telefonu) VALUES (2, '2019-12-02', 1, 'test', 'test@wp.pl', '987654321');
INSERT INTO shop.zamowienie (id, data_zatwierdzenia, stan_zamowienia, nazwa_uzytkownika, email, numer_telefonu) VALUES (3, '2019-12-03', 1, 'Janek Kowalski', 'kowal@wp.pl', 'kowal@wp.pl');
INSERT INTO shop.zamowienie (id, data_zatwierdzenia, stan_zamowienia, nazwa_uzytkownika, email, numer_telefonu) VALUES (4, '2019-12-04', 1, 'Jan Kowalski', 'kowal@wp.pl', 'kowal@wp.pl');
INSERT INTO shop.zamowienie (id, data_zatwierdzenia, stan_zamowienia, nazwa_uzytkownika, email, numer_telefonu) VALUES (8, '2019-12-03', 1, 'Jan Kowalski', 'kowal@wp.pl', 'kowal@wp.pl');
create table zamowienie_produkty
(
    id                 int auto_increment
        primary key,
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

