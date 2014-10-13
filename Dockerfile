# Node & Postgresql
#
# VERSION               0.0.1

FROM nodesource/node:wheezy

ENV PG_VERSION 9.3.3
ENV NODE_ENV production

# Node is Version 10.x
RUN apt-get update \
 && apt-get install --force-yes -y \
            wget \
 && rm -rf /var/lib/apt/lists/*

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
 && wget -q -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
 && apt-get update \
 && apt-get install --force-yes -y \
            postgresql-9.3 \
 && rm -rf /var/lib/apt/lists/* \
 && chown -R root:root /etc/ssl/

VOLUME /usr/src/app
WORKDIR /usr/src/app

CMD ["bash","-c","/etc/init.d/postgresql start && npm test"]
