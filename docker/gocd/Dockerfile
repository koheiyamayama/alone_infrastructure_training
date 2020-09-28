FROM debian:latest
RUN apt update
RUN apt-get install -y curl unzip
RUN curl -fsSL 'https://www.gocd.org/test-drive-gocd/try.sh' | bash -s 'https://download.gocd.org/test-drive/installers/20.8.0/12213/gocd-20.8.0-12213-1147-linux.zip'
