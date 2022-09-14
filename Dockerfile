# syntax=docker/dockerfile:1
#!/usr/bin/env bash
# docker login if needed `docker login docker.io`

FROM ubuntu

MAINTAINER nikhil2584@gmail.com

USER root
RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
COPY ./apache-tomcat-8.5.82-src.tar.gz /opt/tomcat/
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.82-src/* /opt/tomcat/.
RUN apt update
RUN apt install -y default-jdk
RUN java -version
RUN apt install -y nvidia-cuda-toolkit
RUN apt install -y docker.io

#WORKDIR /opt/tomcat/webapps
#RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080
RUN chmod a+rwx /opt/tomcat
ENTRYPOINT ["/opt/tomcat/bin/"]
CMD ["-D", "FOREGROUND"]
#CMD ["/opt/tomcat/bin/catalina.sh", "run"]
