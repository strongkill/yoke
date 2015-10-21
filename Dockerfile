FROM nanobox/base

# install gcc and build tools
RUN echo deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main >> /etc/apt/sources.list.d/pgdg.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update && \
    apt-get install -y postgresql-9.4


ADD bin/. /usr/bin

RUN mkdir -p /var/lib/postgresql/yoke/data

RUN initdb -D /var/lib/postgresql/yoke/data