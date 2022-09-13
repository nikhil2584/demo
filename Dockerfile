FROM ubuntu
<<<<<<< HEAD

MAINTAINER nikhil2584@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.82-src/* /opt/tomcat/.
RUN apt-get install java
RUN java -version

WORKDIR /opt/tomcat/webapps
#RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
=======
LABEL maintainer="nikhil2584@gmail.com"

WORKDIR /root
RUN mkdir /usr/tomcat

RUN apt-get update && apt-get -y install apache2
EXPOSE 8888

ENTRYPOINT ["/usr/sbin/apachectl"]
CMD ["-D", "FOREGROUND"]
COPY index.html /var/www/html/
VOLUME /var/www/html
>>>>>>> 55858d4ae8112f4de063cd8234c402044521514d
