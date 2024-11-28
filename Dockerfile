FROM ubuntu:latest

# Необходима доработка


RUN apt-get -y update; \
    apt-get install ncdu; \
    apt-get install dstat;
    
