FROM alpine:3.11
RUN apk update && apk add curl 

WORKDIR /root/

COPY go_backend

RUN chmod u+x go_backend

EXPOSE 8090

CMD ["./backend"]