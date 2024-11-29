# Необходима доработка

FROM ubuntu:latest

WORKDIR /bash_script

COPY . .

RUN apt-get -y update; \
    apt-get install ncdu; \
    apt-get install dstat;
    
