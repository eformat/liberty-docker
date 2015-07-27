#
# cd ~/src/liberty-docker/
# docker build -t app .
# docker run -d -p 9080:9080 -p 443:9443 app
# http://localhost:9080/Sample1/SimpleServlet
#
FROM websphere-liberty
ADD Sample1.war /opt/ibm/wlp/usr/servers/defaultServer/dropins/
ADD server.xml /opt/ibm/wlp/usr/servers/defaultServer/
ADD jvm.options /opt/ibm/wlp/usr/servers/defaultServer/
ENV LICENSE accept

ENV USERNAME root
ENV TZ Pacific/Auckland

EXPOSE 9080

ENTRYPOINT ["liberty-run"]
CMD ["/opt/ibm/wlp/bin/server", "run", "defaultServer"]

# end
