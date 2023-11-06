FROM golang:latest AS builder

COPY /go/. /app

WORKDIR /app

RUN go build -o full-cycle-rocks




FROM scratch

WORKDIR /app

COPY --from=builder /app .

CMD ["./full-cycle-rocks"]