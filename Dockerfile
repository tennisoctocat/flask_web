FROM ubuntu:16.04

# MAINTANER Cynthia Hom "chom@hmc.edu"

# Fix issue with apt-utils not installed https://github.com/phusion/baseimage-docker/issues/319
# RUN apt-get update && apt-get install -y --no-install-recommends apt-utils


RUN apt-get update -y && \
    apt-get install -y wget && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

# Added to address a docker build error
#RUN pip install --upgrade setuptools --user python && \
   # pip install --upgrade pip

# Try to fix pip upgrade errors
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
    python get-pip.py && \
    pip install --upgrade setuptools

RUN pip install -r requirements.txt

COPY . /app

# CMD [ "app.py" ]
# ENTRYPOINT [ "bash" ] #python" ]
ENTRYPOINT [ "bash" ] 

