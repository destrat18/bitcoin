FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

# Install linux dependencies
RUN apt-get update \
 && apt-get install -y libssl-dev python3-pip software-properties-common git sqlite3 zip python3-venv curl

#bitcoin core
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 \
 libevent-dev libboost-dev \
 libsqlite3-dev \
 libminiupnpc-dev libnatpmp-dev \
 libzmq3-dev \
 systemtap-sdt-dev 

# bitcoin gui
RUN apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools qtwayland5 libqrencode-dev

WORKDIR /app/bitcoin

COPY ./requirements.txt requirements.txt
RUN pip install -r requirements.txt

# COPY ../bitcoin /app/bitcoin

# RUN ./autogen.sh
