#!/usr/bin/env bash

#locales
sudo locale-gen pt_PT.UTF-8
sudo update-locale LANG=pt_PT.UTF-8
sudo update-locale LC_ALL=pt_PT.UTF-8

# update, upgrade
apt-get update && apt-get -y upgrade && apt-get -y autoremove

# install vm-tools && linux virtual image
apt-get install -y open-vm-tools && apt-get install -y linux-image-virtual

# build tools
apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev git libsqlite3-dev

# nodeJS
cd /tmp
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs

# DB Postgres
apt-get install -y postgresql postgresql-contrib postgresql-server-dev-all
# create user
sudo -u postgres createuser portal
sudo -u postgres createdb portal -O portal
sudo systemctl stop postgresql.service