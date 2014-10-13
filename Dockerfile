# Node & Postgresql
#
# VERSION               0.0.1

FROM nodesource/node:wheezy

ENV NODE_ENV production

VOLUME /usr/src/app
WORKDIR /usr/src/app

CMD ["npm","test"]
