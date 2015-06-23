#!/usr/bin/env bash
####################################################################
# Install the necessary components for building and installing
# the unifiedviews system from the github.
#
# This is the LATEST, 2.x version (not a specific branch).
#
# Standard System Updates (Jessie)
apt-get update -y --force-yes
apt-get install -y xinit xterm iceweasel gnome-terminal gnome-shell
apt-get install -y dkms virtualbox-guest-dkms virtualbox-guest-x11
apt-get install -y iceweasel dos2unix gdm3 emacs vim
dpkg-reconfigure gdm3

####################################################################
# Create and start all the docker images here
# https://github.com/docker/docker/issues/12861
apt-get install apt-transport-https
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
echo "deb https://get.docker.com/ubuntu docker main" >> /etc/apt/sources.list
apt-get update -y
apt-get install -y lxc-docker

curl -L https://github.com/docker/compose/releases/download/1.3.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

####################################################################
# Setup other services
# update-rc.d unifiedviews-backend defaults
# Allows login without password
echo "vagrant ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vagrant

####################################################################
# Change the default homepage
echo "user_pref(\"browser.startup.homepage\", \"http://localhost:28080/unifiedviews\");" >> /etc/iceweasel/pref/iceweasel.js
echo "_user_pref(\"browser.startup.homepage\", \"http://localhost:28080/unifiedviews\");" >> /etc/iceweasel/profile/prefs.js

( cd /vagrant/uvdocker ;
  if [ -d Plugin-DevEnv ]
  then
      git clone https://github.com/UnifiedViews/Plugin-DevEnv.git
  else
      cd Plugin-DevEnv; git pull
  fi )

( cd /vagrant/uvdocker ;
  if [ -d Core ]
  then
      git clone --branch=UV_Core_v2.0.3 https://github.com/UnifiedViews/Core.git
  else
      cd Core; git pull
  fi )


####################################################################
apt-get autoclean
echo "****** done with bootstraping"
####################################################################

