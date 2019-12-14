#!/bin/sh

# 1. Core tools
# some duplicate install kepping them for simplicity.
sudo apt install git curl

# Install Python 3.7.3
pyenv install 3.7.3
pyenv global 3.7.3
pip install --upgrade pip
pip install pipenv

# ffmpeg
sudo apt install ffmpeg libavformat-dev libavcodec-dev libavdevice-dev libavutil-dev libswscale-dev libavresample-dev libavfilter-dev

# Build tools
sudo apt install autoconf automake clang libtool pkg-config build-essential # clang-3.8 no candidate exist. Skipping

# libarchive-dev
sudo apt install libarchive-dev

# python-qt4
sudo apt install python-qt4

# zeromq
curl -LO https://github.com/zeromq/libzmq/releases/download/v4.2.3/zeromq-4.2.3.tar.gz
tar xfz zeromq-4.2.3.tar.gz
pushd zeromq-4.2.3
./autogen.sh
./configure CPPFLAGS=-DPIC CFLAGS=-fPIC CXXFLAGS=-fPIC LDFLAGS=-fPIC --disable-shared --enable-static
make
sudo make install
popd
rm -rf zeromq-4.2.3.tar.gz zeromq-4.2.3

# 2. capnproto
curl -O https://capnproto.org/capnproto-c++-0.6.1.tar.gz
tar xvf capnproto-c++-0.6.1.tar.gz
pushd capnproto-c++-0.6.1
./configure --prefix=/usr/local CPPFLAGS=-DPIC CFLAGS=-fPIC CXXFLAGS=-fPIC LDFLAGS=-fPIC --disable-shared --enable-static
make -j4
sudo make install

cd ..
git clone https://github.com/commaai/c-capnproto.git
cd c-capnproto
git submodule update --init --recursive
autoreconf -f -i -s
CFLAGS="-fPIC" ./configure --prefix=/usr/local
make -j4
sudo make install
popd
rm -rf capnproto-c++-0.6.1 c-capnproto/ capnproto-c++-0.6.1.tar.gz

# 5. Add openpilot to your PYTHONPATH
echo 'export PYTHONPATH="/home/openpilot/openpilot"' >> ~/.bashrc
source ~/.bashrc

# 6. Add folders to root
sudo mkdir -v /data
sudo mkdir -v /data/params
sudo chown -v $USER /data/params

# create virtualenv for openpilot
cd
git clone https://github.com/commaai/openpilot
cd openpilot
pipenv install # Install dependencies in a virtualenv
echo "Continue running part2 inside the virtual enviroment"
pipenv shell # Activate the virtualenv









