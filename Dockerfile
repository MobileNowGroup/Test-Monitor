FROM node:8.9.4

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN npm install --registry=https://registry.npm.taobao.org/ -g pm2

ADD package.json /usr/src/app/package.json

RUN npm install --registry=https://registry.npm.taobao.org --production

COPY . /usr/src/app/

RUN chmod o+x ./docker-entrypoint.sh

EXPOSE 3004

ENTRYPOINT [ "/usr/src/app/docker-entrypoint.sh" ]
