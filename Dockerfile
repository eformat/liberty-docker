#
# cd ~/src/liberty-docker/
# docker build -t app .
# docker run -d -p 9080:9080 -p 443:9443 app
# curl http://localhost:9080/SimpleServlet/SimpleServlet
#
FROM websphere-liberty

ADD target/SimpleServlet.war /opt/ibm/wlp/usr/servers/defaultServer/dropins/
ADD server.xml /opt/ibm/wlp/usr/servers/defaultServer/
ADD jvm.options /opt/ibm/wlp/usr/servers/defaultServer/
ENV LICENSE accept

RUN chmod -R 777 /opt/ibm/wlp/usr/servers/defaultServer

EXPOSE 9080

COPY liberty-run /opt/ibm/wlp/bin/
ENV PATH /opt/ibm/wlp/bin:$PATH

ENTRYPOINT ["liberty-run"]
CMD ["/opt/ibm/wlp/bin/server", "run", "defaultServer"]

# end
