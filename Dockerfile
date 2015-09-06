FROM ubuntu:15.04

RUN apt-get update
RUN apt-get -y install libxml2-dev libxslt-dev zlib1g-dev
RUN apt-get -y install python3-pip python3 python3-dev

# We need to install ruby binary to get the correct PDF spacing
RUN apt-get -y install ruby wkhtmltopdf
RUN gem install --no-rdoc wkhtmltopdf-binary

RUN pip3 install lxml

WORKDIR /root
ADD . /root
VOLUME /root/output

RUN mkdir /data
VOLUME /data

WORKDIR /data
