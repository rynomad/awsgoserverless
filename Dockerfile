FROM gliderlabs/alpine
LABEL version="0.3"
LABEL description="This image provides tools to build & deploy Go applications to AWS using serverless framework"
MAINTAINER hello@moni.sh

# Install dependencies
RUN apk update
RUN apk add libc-dev curl

# Install go
RUN apk add go
RUN mkdir /gopath
ENV GOROOT /usr/lib/go
ENV GOPATH /gopath
ENV GOBIN /gopath/bin
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

# Install node & npm
RUN apk add nodejs-npm
RUN npm install -g serverless

# Install awscli
RUN apk -Uuv add groff less python py-pip 
RUN pip install awscli

# Cleanup
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*
