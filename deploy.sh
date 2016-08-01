#!/bin/bash


# build docker image for tomcat
cd $PWD/tomcat && docker build . -t cuicui/tomcat | tail -1 | awk '{ print $NF }'

#build docker image for wget
cd $PWD/get_war && docker build . -t cuicui/get_war | tail -1 | awk '{ print $NF }'

# deploy war in contaner
# it should be the artifact of the java web app project for CI system, like jenkins.
# but I don't have the src, so just use the sample from tomcat for test.
WAR_PATH='https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war'
docker run -t -i --name get_war cuicui/get_war $WAR_PATH
docker run --name sample_app --volumes-from get_war -d -P cuicui/tomcat8

docker port sample_app 8080

# build result
docker attach sample_app
