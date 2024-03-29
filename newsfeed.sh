#!/bin/bash
set +x
# Check for root privs
if [ $UID != 0 ]; then
  echo "You must run $0 as root"
  exit 1
fi

sudo apt-get update
sudo apt-get install openjdk-8-jre git make make-guile -y
git clone "https://github.com/ThoughtWorksInc/infra-problem"
sudo curl "https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein" -o /usr/local/bin/lein
sudo chmod a+x /usr/local/bin/lein
cd infra-problem
make libs
make clean all
cd front-end/public
py serve.py
export APP_PORT="8080"
export STATIC_URL="http://closure-wfe"
export QUOTE_SERVICE_URL="http://closure-quotes"
export NEWSFEED_SERVICE_URL="http://closure-newsfeed"
export NEWSFEED_SERVICE_TOKEN="T1&eWbYXNWG1w1^YGKDPxAWJ@^et^&kX"
cd ..
cd build
java -jar front-end.jar
