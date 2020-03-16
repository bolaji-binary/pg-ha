FROM ubuntu:latest
ENV PG_VERSION 12
RUN apt-get -qq update \
 && apt-get install -y --force-yes apt-transport-https wget curl gnupg2 lsb-release \
 && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
 && wget --quiet -O - https://dl.2ndquadrant.com/gpg-key.asc | apt-key add - \
 && echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
 && echo "deb [arch=$(dpkg --print-architecture)] https://dl.2ndquadrant.com/default/release/apt $(lsb_release -cs)-2ndquadrant main" > /etc/apt/sources.list.d/2ndquadrant.list \
 && apt-get -qq update \
 && apt-get install -y --force-yes pgbouncer postgresql-common postgresql-$PG_VERSION postgresql-client-$PG_VERSION postgresql-contrib-$PG_VERSION pgtap postgresql-$PG_VERSION-pgtap postgresql-$PG_VERSION-pglogical \
 && rm -rf /var/lib/apt/lists/* /var/cache/apt/*
CMD [ "/bin/bash" ]
