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

## Curl Command

* EXAMPLE - GET 

```
curl localhost:4567/animals
```

* EXAMPLE - POST

```
curl -X POST http://localhost:4567/create \
     -H "Content-Type: application/json" \
     -d '{"name": "jurandi", "species":"cat", "age": "4", "owner":"jurema"}'
```
