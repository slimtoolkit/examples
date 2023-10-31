ARG GO_VERSION=1.21.3

FROM golang:${GO_VERSION}-alpine AS builder

RUN apk add --no-cache git
WORKDIR /src
COPY ./go.mod ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /app 

FROM gcr.io/distroless/static:nonroot
LABEL maintainer="c0rwin"

COPY --from=builder /app /app
ENTRYPOINT ["/app"]
