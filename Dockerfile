FROM golang:latest as builder

RUN mkdir -p /go/src
WORKDIR /go/src

COPY ./src .

ENV CGO_ENABLED=0

RUN GOOS=linux go build ./main.go

FROM scratch

WORKDIR /app

COPY --from=builder /go/src/main .

CMD ["/app/main"]