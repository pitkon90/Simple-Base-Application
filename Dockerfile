FROM node:13.6.0-alpine3.10

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY --chown=node:node ["./package.json", "./.babelrc" , "./"]

RUN npm install -g parcel

USER node

RUN	npm install

COPY --chown=node:node ./src ./src

RUN pwd && ls -la && cd src && ls -la && cd scripts && ls -la

EXPOSE 3000

USER root

CMD [ "npm", "start" ]
