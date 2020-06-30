FROM jenkins/jenkins
USER root
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common jq
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update  -qq \
    && apt-get install docker-ce -y
RUN curl -sL https://deb.nodesource.com/setup_10.x |  bash -
RUN rm -f /etc/localtime && \
    ln -s /usr/share/zoneinfo/Europe/Luxembourg /etc/localtime && \
    echo 'Europe/France' > /etc/timezone && \
RUN usermod -aG docker jenkins
