FROM golang:1.18.4-alpine3.16 AS build

WORKDIR /app

ADD . .

RUN go build -o slug-cat main.go 

FROM scratch

COPY --from=build /app/slug-cat /slug-cat

CMD ["/slug-cat"]
