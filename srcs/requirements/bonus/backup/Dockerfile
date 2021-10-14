FROM alpine

RUN apk upgrade --available && apk add go


RUN mkdir /db && mkdir /backup
COPY conf .
RUN go mod tidy

CMD [ "go", "run", "main.go" ]
