############################
# STEP 1 build executable binary
############################
FROM golang:1.12-alpine as builder

# Install git + SSL ca certificates, required to call HTTPS endpoints.
RUN apk update && apk add --no-cache git ca-certificates tzdata && update-ca-certificates

# Create appuser
RUN adduser -D -g '' appuser

WORKDIR $GOPATH/src/mypackage/myapp/

# Use modules to download dependencies, preserves docker cache (unlike go get).
ENV GO111MODULE=on
ENV CGO_ENABLED=0


# Build the binary
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags 'sqlite' -ldflags '-s -w -X 'main.Version=v1.11.2-19-gb34edc8'' -o /go/bin/app 

############################
# STEP 2 build a small image
############################
FROM scratch as serve

# Import from builder.
COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /etc/passwd /etc/passwd

# Copy our static executable
COPY --from=builder /go/bin/app /go/bin/app

# Use an unprivileged user.
USER appuser

EXPOSE 8088 9000
HEALTHCHECK --start-period=2s --interval=10s --timeout=5s \
  CMD ["/go/bin/app", "--ping"]

# Run the binary.
ENTRYPOINT ["/go/bin/app"]

