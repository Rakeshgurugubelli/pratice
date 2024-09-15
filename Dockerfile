from amazonlinux
workdir /root
# installing tomcat on container purpose to build the tomacat dockerimage
add https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz /root
# update package repositories
RUN yum clean all && yum update -y
# installing commands gzip,tar,vim
RUN yum update -y -v && \
    yum install -y vim -v
RUN yum update -y && \
    yum install -y gzip && \
    yum install -y tar
run tar -zxvf apache-tomcat-9.0.93.tar.gz
# moving the untar file to tomcat file
run mv apache-tomcat-9.0.93 tomcat
# copying the tomcat-user.xml file to  /root/tomcat/conf
copy tomcat-users.xml /root/tomcat/conf
# copying the  context.xml to  /root/tomcat/webapps/manager/META-INF
copy  context.xml /root/tomcat/webapps/manager/META-INF
#copying the snapshot file to webapps
copy myweb-8.3.2-SNAPSHOT.war /root/tomcat/webapps
# installing java to run the tomcat
RUN yum install -y java-11-amazon-corretto
# Expose the port Tomcat listens on
EXPOSE 8080
# Set the command to start Tomcat
CMD ["/root/tomcat/bin/catalina.sh", "run"]
