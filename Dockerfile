from tomcat:v2
workdir /root
copy myweb-8.3.2-SNAPSHOT.war /root/tomcat/webapps
CMD ["/root/tomcat/bin/catalina.sh", "run"]
