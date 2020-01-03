# AJI_TUL_2019_Task4
Zadanie 4 - aplikacja końcowa. Termin - XIII zajęcia

# Using docker with mysql
This command will launch clean database for mysql with adminer
```bash
sudo docker-compose -f stack.yml up
```
MYSQL db is on ports:
```
3306
33060
```
To use adminer go to
```
localhost:8080
```
and login using
```
Login: root
Password: example
```
Then import `database/shop.sql.gz`

# RESTful api

If you have Postman you can try importing `AJI_Task4.postman.collection.json` into it.

## Products
### Get
Wyświetlenie kompletnej listy
```http
localhost:8081/products
```
Zwroc dany produkt o konkretnym id
```http
localhost:8081/products/{id}
```
### Post
Dodaj produkt do bazy
```http
localhost:8081/products
```
Body
```json
{
    "nazwa": "Nowy Produkt",
    "opis": "Nowy Produkt",
    "cena_jednostkowa": 6,
    "waga_jednostkowa": 2,
    "kategoria_towaru": 1
}
```
### Put
Zaktualizuj produkt o konkretnym identfikatorze
```http
localhost:8081/products
```
Body
```json
{
    "product": {
        "id": 217,
        "nazwa": "asdfasd",
        "opis": "Nowy Produkt",
        "cena_jednostkowa": 6,
        "waga_jednostkowa": 1,
        "kategoria_towaru": 1
    }
}
```
## Categories
### GET
Zwraca wszystkie kategorie
```http
localhost:8081/categories
```

## Order Status
### GET
Zwraca wszystkie mozliwe stany zamowienia
```http
localhost:8081/status
```

## Orders
### GET
Zwraca wszystkie zamowienia
```http
localhost:8081/orders
```
Wyswietl wszystkie zamowienia uzytkownika
```http
localhost:8081/orders/user/?user={user}
```
Wyświetlenie jednego elementu (po identyfikatorze)
```http
localhost:8081/orders/id/{id}
```
Wyswietl zamówienia wg stanu (1,2,3)
```http
localhost:8081/orders/status/{stan}
```
### PUT
Zmiana stanu zamówienia
```http
localhost:8081/orders/{id_zamowienia}
```
Body
```json
{
	"stan_zamowienia": "2"
}
```
Aktualizacja całego zamówienia
```http
localhost:8081/orders
```
Body
```json
{
    "order": {
    	"id": "3",
        "data_zatwierdzenia": "2019-12-03",
        "stan_zamowienia": 1,
        "nazwa_uzytkownika": "Janek Kowalski",
        "email": "kowal@wp.pl",
        "numer_telefonu": "123456789"
    }
}
```
### POST
Dodaj zamówienie
```http
localhost:8081/orders
```
Body
```json
{
    "data_zatwierdzenia": "2019-12-03",
    "stan_zamowienia": 1,
    "nazwa_uzytkownika": "Jan",
    "email": "kowal@wp.pl",
    "numer_telefonu": "123456789",
    "zamowione_produkty": [
        {
            "id_produktu": 1,
            "ilosc": 1
        },
        {
            "id_produktu": 4,
            "ilosc": 5
        },
        {
            "id_produktu": 7,
            "ilosc": 10
        }
    ]
}
```