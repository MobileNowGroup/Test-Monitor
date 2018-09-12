FROM node:8.9.4

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN npm install --registry=https://registry.npm.taobao.org/ -g pandora-dashboard

ADD package.json /usr/src/app/package.json

RUN npm install --registry=https://registry.npm.taobao.org --production

COPY . /usr/src/app/

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod o+x /docker-entrypoint.sh

EXPOSE 3003
EXPOSE 9081

ENTRYPOINT [ "/docker-entrypoint.sh" ]
