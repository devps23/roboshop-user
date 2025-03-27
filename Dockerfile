FROM             docker.io/node:16
RUN              mkdir /app
COPY            ./ /app/
WORKDIR          /app
RUN              npm install
RUN              wget -O /app/rds-combined-ca-bundle.pem https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem
COPY             run.sh run.sh
ENTRYPOINT       ["bash","run.sh"]








