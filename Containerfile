# Containerfile for ChirpStack v4 - Multi-Arch (amd64/arm64)
# Unprivileged non-root user execution
FROM chirpstack/chirpstack:4.11.0

USER 1000:1000

EXPOSE 8080 8090

ENTRYPOINT ["chirpstack"]
