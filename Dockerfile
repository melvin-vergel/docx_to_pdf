FROM ubuntu:18.04

RUN apt-get clean && apt-get update && apt-get install -y \
    vim \
    openjdk-8-jdk \
    python3-dev \
    python3-pip 

RUN apt-get install -y libreoffice-writer --no-install-recommends && rm -rf /var/lib/apt/lists/*


ENV PYTHONUNBUFFERED 1
RUN mkdir /opt/app
WORKDIR /opt/app


ADD requirements.txt /opt/app
RUN pip3 install -r /opt/app/requirements.txt

ADD webserver.py /opt/app

EXPOSE 80

CMD python3 webserver.py

