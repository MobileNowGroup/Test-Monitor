FROM centos:7

ENV ALINODE_VERSION 4.3.0
ENV HOME /root
ENV TNVM_DIR /root/.tnvm

RUN yum install -y wget

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN mkdir /tmp/node_log
RUN wget -qO- https://raw.githubusercontent.com/aliyun-node/tnvm/master/install.sh | bash
RUN . $TNVM_DIR/tnvm.sh && \
    tnvm install "alinode-v$ALINODE_VERSION"
RUN . $TNVM_DIR/tnvm.sh && \
    tnvm use "alinode-v$ALINODE_VERSION"
RUN . $TNVM_DIR/tnvm.sh && \
    npm install @alicloud/agenthub pm2 -g

ADD package.json /usr/src/app/package.json

RUN . $TNVM_DIR/tnvm.sh && \
  npm install --registry=https://registry.npm.taobao.org --production

COPY . /usr/src/app/

COPY ./docker-entrypoint.sh /
RUN chmod o+x /docker-entrypoint.sh

EXPOSE 3002

ENTRYPOINT [ "/docker-entrypoint.sh" ]
