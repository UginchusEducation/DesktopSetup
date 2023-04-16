FROM jenkins/jenkins:jdk11
USER root

COPY --chown=jenkins:jenkins executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

RUN mkdir -p /jenkins
WORKDIR /jenkins

RUN apt-get update && apt-get install -y lsb-release

RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg

RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
  
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins

# download jenkins usefull plugins
RUN jenkins-plugin-cli --plugins "blueocean"   
RUN jenkins-plugin-cli --plugins "cloudbees-disk-usage-simple"
RUN jenkins-plugin-cli --plugins "docker-workflow"
RUN jenkins-plugin-cli --plugins "docker-plugin"
RUN jenkins-plugin-cli --plugins "docker-commons"
RUN jenkins-plugin-cli --plugins "locale"
RUN jenkins-plugin-cli --plugins "junit"
RUN jenkins-plugin-cli --plugins "copyartifact"
RUN jenkins-plugin-cli --plugins "pipeline-utility-steps"
RUN jenkins-plugin-cli --plugins "git"