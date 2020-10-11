FROM golang:1.15 AS build-env

WORKDIR /go/bin
RUN go get -v github.com/mdlayher/apcupsd_exporter/cmd/apcupsd_exporter

FROM gcr.io/distroless/base
COPY --from=build-env /go/bin/ /

EXPOSE 9162
CMD ["/apcupsd_exporter"]
