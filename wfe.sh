#!/bin/bash

sudo apt-get update  && sudo apt-get install openjdk-8-jre -y && sudo apt-get install git -y && sudo apt-get install make -y && sudo apt-get install make-guile -y && sudo apt-get install python3
git clone https://github.com/ThoughtWorksInc/infra-problem
sudo curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -o /usr/local/bin/lein
sudo chmod a+x /usr/local/bin/lein
cd /home/testadmin/infra-problem
make test
make libs
make clean all
cd /home/testadmin/infra-problem/front-end/public
./serve.py 
xport APP_PORT="8080"
export STATIC_URL="http://closure-wfe"
export QUOTE_SERVICE_URL="http://closure-quotes"
export NEWSFEED_SERVICE_URL="http://closure-newsfeed"
export NEWSFEED_SERVICE_TOKEN="T1&eWbYXNWG1w1^YGKDPxAWJ@^et^&kX"
cd /home/testadmin/infra-problem/build
java -jar front-end.jar