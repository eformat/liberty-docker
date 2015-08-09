Liberty Docker
==============

Because some must use Websphere ...

Built from https://hub.docker.com/_/websphere-liberty/

### checkout
    git clone https://github.com/eformat/liberty-docker
    cd ~/liberty-docker/

### build docker image
    docker build -t app .

### run app
    docker run -d -p 9080:9080 -p 443:9443 app

### test app
    http://localhost:9080/Sample1/SimpleServlet

### And others choose OpenShift ...

###
    oc new-project liberty --display-name="Liberty" --description='WAS Liberty Profile Servlet Container'
    oc new-app https://github.com/eformat/liberty-docker#master --name=liberty --strategy=docker --name=liberty
