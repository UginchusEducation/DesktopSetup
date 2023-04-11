## YouTube Link
For the full 1 hour course watch out youtube:
https://www.youtube.com/watch?v=6YZvp2GwT0A

# Installation
## Build the Jenkins BlueOcean Docker Image
```
docker build -t myjenkins-blueocean:2.387.2-1 .
```

## Create the network 'jenkins'
```
docker network create jenkins
```

## Run the Container
```
docker run --name jenkins-blueocean --restart=on-failure --detach --network jenkins --env DOCKER_HOST=tcp://docker:2376 --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 --volume jenkins-data:/var/jenkins_home --volume jenkins-docker-certs:/certs/client:ro --publish 8080:8080 --publish 50000:50000 myjenkins-blueocean:2.387.2-1
```

## Get the Password
```
docker exec -it jenkins-blueocean bash
cd var/jenkins_home/secrets
cat initialAdminPassword
```

## Connect to the Jenkins
```
https://localhost:8080/
```

## Installation Reference:
https://www.jenkins.io/doc/book/installing/docker/


## alpine/socat container to forward traffic from Jenkins to Docker Desktop on Host Machine

https://stackoverflow.com/questions/47709208/how-to-find-docker-host-uri-to-be-used-in-jenkins-docker-plugin
```
:From documents:
docker run -i --rm --name agent1 --init -v agent1-workdir:"C:\Tools\Jenkins_w" jenkins/agent:latest-alpine-jdk11 java -jar C:\Tools\Jenkins\agent.jar -workDir "C:\Tools\Jenkins_w"
--
docker run -d --restart=always -p 127.0.0.1:2376:2375 --network jenkins -v /var/run/docker.sock:/var/run/docker.sock alpine/socat:latest tcp-listen:2375,fork reuseaddr unix-connect:/var/run/docker.sock
docker inspect <container_id> | grep IPAddress
-
docker inspect musing_dijkstra
172.18.0.3
```

jenkins/agent:latest-alpine-jdk11

## Using my Jenkins Python Agent
```
docker pull devopsjourney1/myjenkinsagents:python
```

docker commit sharp_gagarin uginchus/