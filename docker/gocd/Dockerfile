FROM debian:latest
RUN apt-get update
RUN apt-get install -y gnupg2 curl git
RUN echo "deb https://download.gocd.org /" | tee /etc/apt/sources.list.d/gocd.list
RUN curl https://download.gocd.org/GOCD-GPG-KEY.asc | apt-key add -
RUN apt-get update
RUN apt-get install -y go-agent go-server
RUN service go-agent start
EXPOSE 8153
CMD [ "service", "go-server", "console" ]
