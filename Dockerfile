FROM ghcr.io/krille-chan/fluffychat:v1.18.0 as upstream

FROM docker.io/nginxinc/nginx-unprivileged:alpine
USER root
RUN rm -rf /usr/share/nginx/html
COPY --from=upstream /usr/share/nginx/html /usr/share/nginx/html
USER $UID
