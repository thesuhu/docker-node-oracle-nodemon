FROM node:22

RUN export DEBIAN_FRONTEND=noninteractive 

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libaio1 \
        build-essential \
        unzip \
        curl \
        apt-utils \
        iputils-ping \
        vim \
    && rm -rf /var/lib/apt/lists/*

# install oracle client
RUN mkdir -p opt/oracle
ADD ./oracle/linux/ .

RUN unzip instantclient-basic-linux.x64-12.2.0.1.0.zip -d /opt/oracle \
    && unzip instantclient-sdk-linux.x64-12.2.0.1.0.zip -d /opt/oracle  \
    && mv /opt/oracle/instantclient_12_2 /opt/oracle/instantclient \
    && ln -s /opt/oracle/instantclient/libclntsh.so.12.2 /opt/oracle/instantclient/libclntsh.so \
    && ln -s /opt/oracle/instantclient/libocci.so.12.2 /opt/oracle/instantclient/libocci.so

RUN rm instantclient-basic-linux.x64-12.2.0.1.0.zip \
    && rm instantclient-sdk-linux.x64-12.2.0.1.0.zip

ENV LD_LIBRARY_PATH="/opt/oracle/instantclient"
ENV OCI_HOME="/opt/oracle/instantclient"
ENV OCI_LIB_DIR="/opt/oracle/instantclient"
ENV OCI_INCLUDE_DIR="/opt/oracle/instantclient/sdk/include"
ENV OCI_VERSION=12

RUN echo '/opt/oracle/instantclient/' | tee -a /etc/ld.so.conf.d/oracle_instant_client.conf && ldconfig

RUN npm install nodemon@3.1.10 -g --prefer-online

RUN nodemon -v

RUN mkdir -p /usr/src/myapp
WORKDIR /usr/src/myapp