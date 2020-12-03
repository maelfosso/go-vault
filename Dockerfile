FROM golang:1.15.1-alpine as build
LABEL maintainer="Mael FOSSO <fosso.mael.elvis@gmail.com>"

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

# Move to working directory /src
WORKDIR /src

# Copy and download dependency using go mod
COPY go.mod .
COPY go.sum .
RUN go mod download

# Copy the code into the container
COPY . .

# Build the application
RUN go build -a -installsuffix cgo -o /bin/vault .
RUN chmod +x /bin/vault

# Expose HTTP and gRPC port
EXPOSE 8080
EXPOSE 8081

# 2nd stage
FROM scratch AS bin

# Copy the excutable
COPY --from=build /bin/vault /bin/vault

ENTRYPOINT ["/bin/vault"]
