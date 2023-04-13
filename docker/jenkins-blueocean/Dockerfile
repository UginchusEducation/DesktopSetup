FROM jenkins/jenkins:2.387.2-lts-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.27.3"   
RUN jenkins-plugin-cli --plugins "cloudbees-disk-usage-simple:178.v1a_4d2f6359a_8"
RUN jenkins-plugin-cli --plugins "docker-workflow:563.vd5d2e5c4007f"
RUN jenkins-plugin-cli --plugins "docker-plugin:1.3.0"
RUN jenkins-plugin-cli --plugins "docker-commons:419.v8e3cd84ef49c"
RUN jenkins-plugin-cli --plugins "locale:262.ved03281fa_64f"
RUN jenkins-plugin-cli --plugins "junit:1189.v1b_e593637fa_e"