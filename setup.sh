#!/bin/bash

# check is user a root user.
# apt-get update
# apt-get install maven
# mvn test
# mvn package
# apt-get install tomcat9
# cp -rvf target/hello-world-0.0.1-SNAPSHOT.war /var/lib/tomcat9/webapps/app.war

function pkgInstall() {
    local pkgName=$(1)
    apt-get install -u $pkgName || { echo "\033[0;31mNot be able to install $pkgName.\033[0m";exit 1; }  # install package
}

function mvnOpr() {
    local mvnCmd=$(1)
    mvn $mvnCmd || { echo "\033[0;31m mvn '$mvnCmd' failed.\033[0m";exit 1; }  # execute maven command
}

# check if the user is root
test $UID -eq 0 || { echo -e "\033[0;31mYou must be root to run this script.\033[0m"; exit 1; }

apt-get update || { echo "\033[0;31mNot be able to update the package list.\033[0m";exit 1; }  # update the package list ---> location of the package

pkgInstall maven  # install maven
pkgInstall tomcat9  # install tomcat9
mvnOpr test  # run maven test
mvnOpr package  # run maven package

cp -rvf target/hello-world-0.0.1-SNAPSHOT.war /var/lib/tomcat9/webapps/app.war







