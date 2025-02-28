FROM        docker.io/node
RUN         apt-get install unzip -y
RUN         mkdir /app
WORKDIR     /tmp
ADD         https://roboshop-artifacts.s3.amazonaws.com/user.zip /tmp/user.zip
WORKDIR     /app
RUN         unzip /tmp/user.zip /app
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





