#!/usr/bin/env bash

#locales
sudo locale-gen pt_PT.UTF-8
sudo update-locale LANG=pt_PT.UTF-8
sudo update-locale LC_ALL=pt_PT.UTF-8

# update, upgrade
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get install -y build-essential libssl-dev libpq-dev libyaml-dev libreadline-dev openssl curl git-core zlib1g-dev bison libxml2-dev libxslt1-dev libcurl4-openssl-dev libsqlite3-dev sqlite3 nodejs postgresql postgresql-contrib

# Git
git config --global color.ui true
git config --global user.name "Miguel Sampaio"
git config --global user.email "sampaio.veiga@gmail.com"

# Ruby
cd /tmp
wget https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz
tar -xvzf ruby-2.2.3.tar.gz
cd ruby-2.2.3
./configure
make
sudo make install

# Rails no doc
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler
gem install rails

# DB Postgres
#sudo su - postgres -c 'createuser -s vagrant'
#sudo su - postgres -c 'createdb portal_dev -O vagrant'
#CREATE USER ror_user WITH PASSWORD 'ror_user_password'
#CREATE DATABASE portal WITH OWNER ror_user;
sudo service postgresql stop

# Apache
sudo apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  mkdir /var/www
  ln -fs /vagrant /var/www/html
fi

# Passenger
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt-get install -y apt-transport-https ca-certificates
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main > /etc/apt/sources.list.d/passenger.list'
sudo apt-get update
sudo apt-get install -y libapache2-mod-passenger
sudo a2enmod passenger
sudo apache2ctl restart
sudo service apache2 stop

cd /vagrant
bundle update
bundle install

# End
echo "All done installing!
Remember to set apache site to dev

Next steps: type 'vagrant ssh' to log into the machine."
