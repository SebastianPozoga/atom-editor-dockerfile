FROM ubuntu
MAINTAINER Sebastian Pożoga <sebastian@pozoga.eu>

# prepare
RUN apt-get update

# install nodejs
RUN apt-get install -y wget curl git build-essential nodejs npm
RUN npm install --global n
RUN n v6.10.3

# install python 2.X
RUN apt-get -y install libgnome-keyring-dev
RUN npm config set python /usr/bin/python2 -g

# build ATOM
RUN apt-get install -y build-essential ca-certificates libgtk2.0-0 libxtst6  libnss3  libgconf-2-4 libasound2 fakeroot gconf2  gconf-service  libcap2  libnotify4 libxtst6 libnss3 gvfs-bin xdg-utils
RUN apt-get install -y libx11-dev libxkbfile-dev libxtst-dev
WORKDIR /root
RUN git clone https://github.com/atom/atom.git
WORKDIR /root/atom
RUN git checkout tags/v1.16.0
RUN script/build --install
