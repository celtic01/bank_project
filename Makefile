postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres12 dropdb --username=root --owner=root simple_bank

migrateup1:
	migrate -path db/migration -database "postgresql://root:"?JuF[~ilCru.W)Dev2|Y)~Aez_"@pg-simplebank.cdfrsad3v3po.us-west-2.rds.amazonaws.com:5432/simple_bank" -verbose up 1

migrateup:
	migrate -path db/migration -database "postgresql://root:u%3A%3FJuF%5B~ilCru.W%29Dev2%7CY%29~Aez_@pg-simplebank.cdfrsad3v3po.us-west-2.rds.amazonaws.com:5432/simple_bank" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:"?JuF[~ilCru.W)Dev2|Y)~Aez_"@pg-simplebank.cdfrsad3v3po.us-west-2.rds.amazonaws.com:5432/simple_bank" -verbose down

migratedown1:
	migrate -path db/migration -database "postgresql://root:"?JuF[~ilCru.W)Dev2|Y)~Aez_"@pg-simplebank.cdfrsad3v3po.us-west-2.rds.amazonaws.com:5432/simple_bank" -verbose down 1

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -destination db/mock/store.go -package mockdb github.com/celtic01/bank_project/db/sqlc Store

.PHONY: postgres createdb dropdb migrateup migrateup1 migratedown migratedown1 server mock
