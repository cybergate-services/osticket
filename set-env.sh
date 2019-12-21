#!/usr/bin/env bash
rm -rf ./.env

USER_PASSWORD=$(LC_ALL=C </dev/urandom tr -dc A-Za-z0-9 | head -c 28)
DB_PASSWORD=$(LC_ALL=C </dev/urandom tr -dc A-Za-z0-9 | head -c 28)
DB_ROOT_PASSWORD=$(LC_ALL=C </dev/urandom tr -dc A-Za-z0-9 | head -c 28)
SECRET=$(openssl rand -hex 16)
cat environment/mariadb.env > ./.mariadb.env
cat environment/letsencrypt.env > ./.letsencrypt.env
cat  environment/osticket.env > ./.osticket.env
cat  environment/db-backup.env > ./.db-backup.env
sed -ie "s/CH_MYSQL_ROOT_PASSWORD/${DB_ROOT_PASSWORD}/g" ./.mariadb.env
sed -ie "s/CH_MYSQL_PASSWORD/${DB_PASSWORD}/g" ./.mariadb.env
sed -ie "s/CH_MYSQL_ROOT_PASSWORD/${DB_ROOT_PASSWORD}/g" ./.osticket.env
sed -ie "s/CH_MYSQL_PASSWORD/${DB_PASSWORD}/g" ./.osticket.env
sed -ie "s/CH_INSTALL_SECRET/${SECRET}/g" ./.osticket.env
sed -ie "s/CH_ADMIN_PASSWORD/${USER_PASSWORD}/g" ./.osticket.env
sed -ie "s/CH_DB_PASSWORD/${DB_PASSWORD}/g" ./.db-backup.env

