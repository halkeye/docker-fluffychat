ARG UPSTREAM_VERSION=v1.22.0
FROM ghcr.io/krille-chan/fluffychat:${UPSTREAM_VERSION} as upstream

FROM docker.io/nginxinc/nginx-unprivileged:alpine
USER root
RUN rm -rf /usr/share/nginx/html
COPY --from=upstream /usr/share/nginx/html /usr/share/nginx/html
USER $UID
