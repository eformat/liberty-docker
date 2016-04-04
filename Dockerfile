#
# cd ~/src/liberty-docker/
# docker build -t app .
# docker run -d -p 9080:9080 -p 443:9443 app
# curl http://localhost:9080/SimpleServlet/SimpleServlet
#
FROM websphere-liberty

FROM websphere-liberty:webProfile7
ADD Sample1.war /config/dropins/

#ADD target/SimpleServlet.war /opt/ibm/wlp/usr/servers/defaultServer/dropins/
#ADD server.xml /opt/ibm/wlp/usr/servers/defaultServer/
#ADD jvm.options /opt/ibm/wlp/usr/servers/defaultServer/

ENV LICENSE accept

RUN chmod -R 777 /opt/ibm/wlp/usr/servers/defaultServer

EXPOSE 9080

ENV PATH /opt/ibm/wlp/bin:$PATH

#ENTRYPOINT ["liberty-run"]
#ENTRYPOINT ["/opt/ibm/wlp/bin/server", "run", "defaultServer"]
CMD ["/opt/ibm/wlp/bin/server", "run", "defaultServer"]

# end
