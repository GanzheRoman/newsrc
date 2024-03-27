FROM golang:1.21-alpine AS build

WORKDIR /app

COPY . .

RUN go mod download
RUN go build -o app users/main.go

FROM alpine:3.18
WORKDIR /app

COPY --from=build ./app .

ENTRYPOINT [ "./app" ]