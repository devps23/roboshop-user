FROM        docker.io/node:16
RUN         apt-get update && apt-get install -y wget unzip curl && \
            apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR     /tmp
RUN         curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
RUN         unzip /tmp/user.zip
RUN         mkdir -p app
WORKDIR     /app
RUN         mv /tmp/* /app/
RUN         rm -rf /tmp/*
RUN         npm install
RUN         wget -O /app/rds-combined-ca-bundle.pem https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem
COPY         run.sh /
ENTRYPOINT   ["bash","/app/run.sh"]



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





