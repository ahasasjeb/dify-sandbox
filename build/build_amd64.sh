rm -f internal/core/runner/python/python.so
rm -f internal/core/runner/python/nodejs.so
rm -f /tmp/sandbox-python/python.so
rm -f /tmp/sandbox-python/nodejs.so
CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -o internal/core/runner/python/python.so -buildmode=c-shared -ldflags="-s -w" cmd/lib/python/main.go
CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -o internal/core/runner/nodejs/nodejs.so -buildmode=c-shared -ldflags="-s -w" cmd/lib/nodejs/main.go
GOOS=linux GOARCH=amd64 go build -o main -ldflags="-s -w" cmd/server/main.go