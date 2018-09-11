FROM node:8.9.4

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN npm install --registry=https://registry.npm.taobao.org/ -g pm2

ADD package.json /usr/src/app/package.json

RUN npm install --registry=https://registry.npm.taobao.org --production

COPY . /usr/src/app/

EXPOSE 3001

CMD [ "pm2", "start", "pm2.yml", "--no-daemon"]
