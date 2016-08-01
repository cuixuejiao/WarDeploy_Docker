FROM ubuntu:latest
MAINTAINER cuicui "cui.xuejiao@msn.com"
ENV REFESHED_AT 2016-07-27

RUN apt-get -yqq update
RUN apt-get -yqq install wget

VOLUME [ "/var/lib/tomcat8/webapps/" ]
WORKDIR /var/lib/tomcat8/webapps/

ENTRYPOINT [ "wget" ]

CMD [ "-?" ]
