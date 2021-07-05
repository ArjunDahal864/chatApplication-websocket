FROM golang:alpine

WORKDIR /chatApplication

COPY . .
COPY go.mod ./

RUN go mod tidy

RUN go mod download

RUN go get github.com/githubnemo/CompileDaemon

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait /wait
RUN chmod +x /wait

ENTRYPOINT CompileDaemon --command="go run ."