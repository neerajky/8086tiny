# BASE CONFIG
FROM ubuntu-debootstrap:15.04
MAINTAINER Chroma Systems <systems@chromasports.com>

RUN apt-get update
RUN apt-get -y install curl wget vim
# BASE CONFIG

# Install container specific packages
RUN apt-get -y install nodejs npm git

# Add source
COPY ./mock /app/
#COPY ./node_modules /app/node_modules
COPY ./package.json /app/
# Add SSL cert
COPY ./config/apache2/editec-app.com.key /etc/ssl/private/
COPY ./config/apache2/editec-app.com.key /app/config/apache2/
COPY ./config/apache2/editec-app.com.crt /etc/ssl/certs/
COPY ./config/apache2/editec-app.com.crt /app/config/apache2/

# Set app dir ownership to www-data
RUN chown -R 33:33 /app
RUN ln -s /usr/bin/nodejs /usr/bin/node

EXPOSE 8080
WORKDIR /app
RUN npm install

CMD ["node", "mock-server.js"]
