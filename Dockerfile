FROM        docker.io/node:16
RUN         apt-get update && \
            apt-get install -y wget gnupg unzip && \
            wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add -
COPY        mongo.repo  /etc/apt/sources.list.d/mongodb-org-6.0.list
RUN         apt-get update && \
            apt-get install -y mongodb-mongosh && \
            apt-get clean && \
            rm -rf /var/lib/apt/lists/*
RUN         mkdir /app
WORKDIR     /tmp
ADD         https://roboshop-artifacts.s3.amazonaws.com/user.zip /tmp/user.zip
WORKDIR     /app
RUN         unzip /tmp/user.zip -d /app/
RUN         rm -rf /tmp/*
RUN         npm install
COPY        run.sh /
ENTRYPOINT  ["bash","/run.sh"]

# multi stage dockerfile
# FROM        redhat/ubi9
# WORKDIR     /app
# ADD         user/*  /app/
#
# FROM        node
# RUN         rm -rf /etc/systemd/system/user.service
# WORKDIR     /app
# RUN         /tmp/*  -d /app/
# RUN         npm install
# ADD         user.service  /etc/systemd/system/user.service





