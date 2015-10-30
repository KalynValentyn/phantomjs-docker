FROM ubuntu:14.04
MAINTAINER Kalyn Valentyn <kalyn@litslink.com>

# Env
ENV PHANTOMJS_VERSION 1.9.8git init

# Install or update to the latest system software
RUN apt-get update
RUN apt-get install build-essential chrpath libssl-dev libxft-dev

# Install these packages needed by PhantomJS to work correctly.
RUN apt-get install libfreetype6 libfreetype6-dev
RUN apt-get install libfontconfig1 libfontconfig1-dev

# Get it from the PhantomJS website.
RUN cd ~
RUN export PHANTOM_JS="phantomjs-1.9.8-linux-x86_64"
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
RUN tar xvjf $PHANTOM_JS.tar.bz2

# move Phantomjs folder to /usr/local/share/ and create a symlink
RUN mv $PHANTOM_JS /usr/local/share
RUN ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
