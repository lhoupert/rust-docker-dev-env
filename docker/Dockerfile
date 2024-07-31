# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.209.6/containers/rust/.devcontainer/base.Dockerfile
# [Choice] Debian OS version (use bullseye on local arm64/Apple Silicon): buster, bullseye
ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/rust:1-${VARIANT}

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
RUN apt-get update && apt-get upgrade -y


# Install zscaler certificate and rebuild certificate store
# Make Python requests library use system certificate (zscaler.pem) rather than certifi
#-------------------------------------------------
COPY zscaler.pem  ./zscaler.pem
RUN tee -a /etc/ssl/certs/ca-certificates.crt < ./zscaler.pem

ENV REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
ENV NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-certificates.crt


# Install Rustlings https://github.com/rust-lang/rustlings
RUN cargo install rustlings
RUN rustlings init
RUN chown -R vscode:vscode /rustlings  %
