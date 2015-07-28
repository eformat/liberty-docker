Liberty Docker
==============

Because some just must use Websphere ...

###
    cd ~/src/liberty-docker/

###
    docker build -t app .

###
    docker run -d -p 9080:9080 -p 443:9443 app

###
    http://localhost:9080/Sample1/SimpleServlet

And others choose OpenShift ...

###
    oc new-project liberty --display-name="Liberty" --description='WAS Liberty Profile Servlet Container'
    oc new-app https://github.com/eformat/liberty-docker#master --name=liberty --strategy=docker --name=liberty
