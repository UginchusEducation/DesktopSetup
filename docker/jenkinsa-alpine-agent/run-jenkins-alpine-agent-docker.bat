docker run -d ^
--restart=always ^
-p 127.0.0.1:2376:2375 ^
--network jenkins ^
-v /var/run/docker.sock:/var/run/docker.sock ^
uginchus/myjenkins-agent:alpine-1 ^
tcp-listen:2375,fork,reuseaddr ^
unix-connect:/var/run/docker.sock