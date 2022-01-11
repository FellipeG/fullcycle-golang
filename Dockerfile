FROM golang:1.17-alpine AS builder

WORKDIR /var/www

COPY ./fullcycle-rocks.go .

RUN go build fullcycle-rocks.go

FROM scratch
WORKDIR /var/www
COPY --from=builder /var/www/fullcycle-rocks .
ENTRYPOINT ["./fullcycle-rocks"]