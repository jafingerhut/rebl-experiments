#! /bin/bash

USER_DEPS="$HOME/.clojure/deps.edn"
REBL_JAR="$HOME/clj/rebl/REBL-LATEST.jar"

set -x
/bin/rm -fr .cpcache
uname -a
ls -l "${USER_DEPS}"
echo "----------------------------------------"
cat "${USER_DEPS}"
echo "----------------------------------------"
ls -l "${REBL_JAR}"
openssl md5 "${REBL_JAR}"
java -version
clj -Sdescribe
exec clj -R:rebl -m cognitect.rebl
