docker run --name jenkins-blueocean ^
--privileged ^
-dp 3000:3000 ^
--restart=on-failure --detach --network jenkins ^
--env DOCKER_HOST=tcp://docker:2376 ^
--env DOCKER_CERT_PATH=/certs/client ^
--env DOCKER_TLS_VERIFY=1 ^
--volume /mnt/W/Jenkins:/var/jenkins_home ^
--volume /root/jenkins/certs:/certs/client:ro ^
--publish 8080:8080 ^
--publish 50000:50000 ^
myjenkins-blueocean:1