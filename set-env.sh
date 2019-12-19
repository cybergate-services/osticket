#!/usr/bin/env bash
rm -rf ./.env

USER_PASSWORD=$(LC_ALL=C </dev/urandom tr -dc A-Za-z0-9 | head -c 28)
DB_PASSWORD=$(LC_ALL=C </dev/urandom tr -dc A-Za-z0-9 | head -c 28)
DB_ROOT_PASSWORD=$(LC_ALL=C </dev/urandom tr -dc A-Za-z0-9 | head -c 28)
SECRET=$(openssl rand -hex 16)
cat enviorenment/mariadb.env > ./.mariadb.env
cat environment/letsencrypt.env > ./.letsencrypt.env
cat environment/osticket.env > ./.osticket.env


