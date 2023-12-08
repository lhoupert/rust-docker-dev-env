#!/bin/sh

cp /etc/ssl/certs/zscaler.pem zscaler.pem

# # Build/run
docker-compose -f docker/docker-compose.yml build
docker-compose -f docker/docker-compose.yml up -d

rm zscaler.pem