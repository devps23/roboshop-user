FROM        node
RUN         apt-get install unzip -y
RUN         mkdir /app
WORKDIR     /tmp
ADD         https://roboshop-artifacts.s3.amazonaws.com/user.zip /tmp/user.zip
WORKDIR     /app
RUN         unzip /tmp/user.zip /app
RUN         npm install
COPY        run.sh /
ENTRYPOINT  ["bash","/run.sh"]

