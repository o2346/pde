#/bin/bash

latest="`curl https://www.oracle.com/java/technologies/downloads/\#java11 | grep -Eoh "http.*jdk-11.*.deb" | sort | head -n1 | grep -Eoh 'jdk-[0-9.]*'`"
hasLatest="`ls /usr/lib/jvm/ | grep oracle | sort | grep -Eoh 'jdk-[0-9.]*' | grep $latest`"
if [ -z "$hasLatest" ]; then
  echo 'no latest found'
  xdg-open https://www.oracle.com/java/technologies/downloads/\#java11
  #curl https://www.oracle.com/java/technologies/downloads/\#java11 | grep -Eoh "http.*jdk-11.*.deb" | sort | head -n1 | xargs wget
fi
