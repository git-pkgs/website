FROM ghcr.io/gohugoio/hugo:v0.164.0 AS builder

WORKDIR /project
COPY --chown=hugo:hugo . .

RUN hugo --minify

FROM nginx:alpine
COPY --from=builder /project/public /usr/share/nginx/html
EXPOSE 80
