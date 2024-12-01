FROM python:3.14-rc-bullseye

RUN apt-get -y update && apt-get -y upgrade
RUN apt install -y  build-essential cmake doxygen \
     libboost-system-dev libboost-dev python3-dev gettext git \
     libboost-date-time-dev libboost-filesystem-dev \
     libboost-iostreams-dev libboost-python-dev libboost-regex-dev \
     libboost-test-dev libedit-dev libgmp3-dev libmpfr-dev texinfo tzdata

RUN mkdir /app
COPY . /app/
WORKDIR /app
RUN ./acprep configure
RUN ./acprep make

ENTRYPOINT [ "/app/ledger" ]
