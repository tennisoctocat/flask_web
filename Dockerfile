FROM ubuntu:16.04

RUN apt-get update -y && \
    apt-get install -y wget && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

# Fix pip upgrade errors, see https://stackoverflow.com/questions/72270592/syntaxerror-when-pip-install-pip-def-readrel-path-str 
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
    python get-pip.py && \
    pip install --upgrade setuptools

RUN pip install -r requirements.txt

COPY . /app

CMD [ "app.py" ]
ENTRYPOINT [ "python" ]

