FROM neo9polska/nodejs-bower-gulp

# Env
ENV PHANTOMJS_VERSION 1.9.8

# Install or update to the latest system software
RUN apt-get update -qq
RUN apt-get install -qq build-essential chrpath libssl-dev libxft-dev

# Install these packages needed by PhantomJS to work correctly.
RUN apt-get install -qq libfreetype6 libfreetype6-dev
RUN apt-get install -qq libfontconfig1 libfontconfig1-dev

# Install wget
RUN apt-get install -qq wget

# Get it from the PhantomJS website.
RUN cd /usr/local/share 
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2
RUN tar xvjf phantomjs-1.9.8-linux-x86_64.tar.bz2

# create a symlink
RUN ln -sf /usr/local/share/phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/bin/

# Clean installiation hash
RUN  apt-get autoremove -y 
RUN  apt-get clean all

# Make phantomjs as Node module.
RUN npm install phantom

# Default command
CMD ["/usr/local/bin/phantomjs"]
