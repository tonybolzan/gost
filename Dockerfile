FROM golang:1.9-alpine as builder
RUN apk add --update git
RUN CGO_ENABLED=0 GOOS=linux go get github.com/ginuerzh/gost/cmd/gost


FROM scratch
LABEL maintainer="Tonin R. Bolzan <tonin@bolzan.io>, Mcl <mixool0204@gmail.com>"
COPY --from=builder /go/bin/gost /gost
ENTRYPOINT ["/gost"]
