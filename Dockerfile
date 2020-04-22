FROM golang:1.11
LABEL version="0.7"
LABEL description="This image provides tools to build & deploy Go applications to AWS using serverless framework"
MAINTAINER hello@moni.sh

# Turn on module support
ENV GO111MODULE on

# Install deps
RUN apt-get update
RUN apt-get install -y python python-pip groff less curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs zip
RUN npm install -g serverless
RUN pip install awscli
