FROM golang:1.25-alpine AS builder

RUN apk add --no-cache git hugo

WORKDIR /build
COPY . .

RUN hugo --minify

FROM nginx:alpine
COPY --from=builder /build/public /usr/share/nginx/html
EXPOSE 80
