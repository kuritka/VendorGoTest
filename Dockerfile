#https://github.com/golang/go/wiki/Modules

#docker build . -t kuritka/vendor-go1.13:v0.0.1
#docker run -it --rm kuritka/vendor-go1.13:v0.0.1
FROM amd64/golang:1.13
WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...

# RUN go mod verify
# RUN go build .

# verification of vendored folder is useless because verifying the checksums of the vendored modules
# requires the full module content (because that is what is checksummed),
# so either way you're going to have to download the full module into the local module cache.
#in GO 1.13 and lover you must explicitly put mod=vendor to build vendor folder. in GO 1.14 you ignore that because mod=vendor is added automatically
RUN go build -mod=vendor
RUN go lint -mod=vendor


ENTRYPOINT ["./awesomeProject1"]

## Logger configured HELLO FROM VENDOR FOLDER or Logger configured  if you remove mod=vendor attribute
