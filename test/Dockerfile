FROM ubuntu

RUN apt-get update &&\
    apt-get install -y python3 git tree

RUN useradd -m mo

USER mo

WORKDIR /home/mo

COPY test.sh ./

ENTRYPOINT ./test.sh
