FROM node:20.17.0-bullseye-slim
RUN apt-get update && apt-get install -y --no-install-recommends dumb-init \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
ENV NODE_ENV production #
ENV PORT 3000
WORKDIR /usr/src/app
COPY --chown=node:node . .
RUN npm install
RUN npm fund
RUN npm run build
USER node
EXPOSE 3000

CMD ["npm", "start"]