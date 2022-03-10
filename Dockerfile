FROM node:latest@sha256:08e37ce0636ad9796900a180f2539f3110648e4f2c1b541bc0d4d3039e6b3251

ENV NODE_OPTIONS=--openssl-legacy-provider

COPY . /app

RUN chown -R node:node /app
WORKDIR /app
USER node
