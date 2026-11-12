# tinytraffic on Railway: official upstream image egoist/tinytraffic (AGPL-3.0), binary unmodified.
# Changes for Railway only: run as root so the app can write to the root-owned Railway volume at /data,
# and trust the Railway edge proxy for real visitor IPs. Defaults are baked as ENV because Railway
# templates drop plain variable values.
FROM ghcr.io/egoist/tinytraffic:0.3.2
LABEL org.opencontainers.image.source="https://github.com/onepush-dev/tinytraffic"
USER 0:0
ENV TT_ADDR=:8080 \
    TT_DATA_DIR=/data \
    TT_TRUST_PROXY=true \
    TT_MEMORY_LIMIT=512MB
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/tinytraffic"]
CMD ["serve"]
