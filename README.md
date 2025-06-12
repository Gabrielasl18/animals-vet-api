# animals-vet-api
Project created with the purpose of understanding the basics of the Ruby programming language architecture.

Architecture:

<img width="1381" alt="Captura de Tela 2025-05-19 às 00 26 13" src="https://github.com/user-attachments/assets/e41d9274-d0ba-4776-b32d-4cd2807dc4b1" />


# Run application locally

```
docker compose up --build
```

## Connecting to the MYSQL

```
docker exec -it animals-vet-mysql mysql -uroot -proot
```

## Creating table in MYSQL for test

```
CREATE TABLE animals_cad (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  age INT,
  species VARCHAR(255),
  weight FLOAT,
  owner VARCHAR(255),
);
```

## Curl Command

* EXAMPLE *POST* - create animal in database

```
curl -X POST http://localhost:4567/create \
  -H "Content-Type: application/json" \
  -d '{"name": "Fred", "age": 10, "species": "cat", "weight": 12, "owner": "Gabe"}'
```

* EXAMPLE *GET* - all animals

```
curl localhost:4567/animals
```

* EXAMPLE *GET* - consultation fee per animal

```
curl "localhost:4567/consult?name=Fred"
```

* EXAMPLE *GET* - get the number of actions made in the database

```
curl -X DELETE http://localhost:4567/actions
```

* EXAMPLE *DELETE* - delete animal for id

```
curl -X DELETE http://localhost:4567/animals/1 
```