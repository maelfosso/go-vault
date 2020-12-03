# Micro-service in Go with Go-kit Framework

That project comes from **Go programming Blueprints** book.
I was interested by learning how to use Go-kit.

## Build With

- Golang
- Docker
- Bash

## Prerequisites

- Git
- Golang
- Docker

## Setup

Clone the repository
```
git clone https://github.com/maelfosso/go-vault.git
```

Run the application
```
$> cd go-vault
$> docker build -t maelfosso/vault .
$> docker container run maelfosso/vault
```

Now test the app
```
$> cd cmd/vaultcli
$> go install
$> vaultcli hash go-vault
[return the hash here]
$> vaultcli validate go-vault [paste the returned hash here]
```

Now test the RESTful API
```
$> curl -X POST http://localhost:8080/hash -d '{"password": "go-vault"}'
$> curl -X POST http://localhost:8080/validate -d '{"password": "go-vault", "hash": "[paste the returned hash here]"}'
```

## Things Learned

In that project, you go through

- gRPC
- HTTP Restful
- Build command line tool in Golang

Concerning Go-kit, there are

- Creating services
- Adding Endpoints
- Use only one Endpoints for serving HTTP and gRPC requests
- Add Middleware

## Authors

**Mael FOSSO**
- [Github](https://github.com/maelfosso) 
- [LinkedIn](https://linkedin.com/in/mael-fosso-650b6346/)
