#!/bin/bash

sudo apt-get update  && sudo apt-get install openjdk-8-jre -y && sudo apt-get install git -y && sudo apt-get install make -y && sudo apt-get install make-guile -y && sudo apt-get install python3
git clone https://github.com/ThoughtWorksInc/infra-problem
sudo curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -o /usr/local/bin/lein
sudo chmod a+x /usr/local/bin/lein
cd /home/testadmin/infra-problem
make libs
make clean all
cd /home/testadmin/infra-problem/front-end/public
./serve.py
export APP_PORT="8080"
cd build/
java -jar newsfeed.jar

