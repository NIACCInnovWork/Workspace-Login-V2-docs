FROM nginx:alpine-slim

COPY build/html /usr/share/nginx/html/docs/
