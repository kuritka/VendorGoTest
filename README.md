# Vendoring folders and verify
 

for vendored folder you must explicitly put `mod=vendor` for go 1.13 or lower.
for go 1.14 is mod vendor included automatically 

https://github.com/golang/go/wiki/Modules

## <= go 1.13
```bash
go mod edit -go 1.13

go run -mod=vendor ./main.go
# HELLO FROM VENDOR

go run ./main.go
# logger configured
```

## >= go 1.14

```bash
go mod edit -go 1.14

go run ./main.go
# HELLO FROM VENDOR
```


verification of vendored folder is useless because verifying the checksums of the vendored modules
requires the full module content (because that is what is check-summed),
so either way you're going to have to download the full module into the local module cache.
solving this might be at go 1.15

