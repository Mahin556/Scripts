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

read -p "Please enter a app context: " APP_CONTEXT
APP_CONTEXT=${APP_CONTEXT:-app}  # set default app context to 'app' if not provided

apt-get update || { echo "\033[0;31mNot be able to update the package list.\033[0m";exit 1; }  # update the package list ---> location of the package

pkgInstall maven  # install maven
pkgInstall tomcat9  # install tomcat9
mvnOpr test  # run maven test
mvnOpr package  # run maven package

# if cp -rvf target/hello-world-0.0.1-SNAPSHOT.war /var/lib/tomcat9/webapps/app.war; then
#     echo -e "\033[0;32mDeployment successful.\033[0m"
# else
#     echo -e "\033[0;31mDeployment failed.\033[0m"
#     exit 1
# fi

if cp -rvf target/hello-world-0.0.1-SNAPSHOT.war /var/lib/tomcat9/webapps/${APP_CONTEXT}.war; then
    echo -e "\033[0;32mDeployment successful. Now you can access your app at http://localhost:8080/${APP_CONTEXT}.\033[0m"
else
    echo -e "\033[0;31mDeployment failed.\033[0m"
    exit 1
fi

exit 0  # exit with success code
# end of script


