# dockerfile-ubuntu-ssh

Try this image from docker hub :

docker run -d --name ubuntussh -p 24:22 fredericeducentre/ubuntu-ssh

Then connect to the container

ssh to test@localhost -p 24 with the password test

Any contribution is welcome :) !

[Only for linux distributions - Temporary the time to find a way to docker in docker]

This image include docker if your host have docker install try this :

docker run -d --name ubuntussh -p 24:22 -v /var/run/docker.sock:/var/run/docker.sock fredericeducentre/ubuntu-ssh
