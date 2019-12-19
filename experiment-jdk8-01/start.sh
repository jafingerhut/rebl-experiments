#! /bin/bash

set -x
/bin/rm -fr .cpcache
uname -a
ls -l $HOME/.clojure/deps.edn
echo "----------------------------------------"
cat $HOME/.clojure/deps.edn
echo "----------------------------------------"
java -version
clj -Sdescribe
exec clj -R:rebl -m cognitect.rebl
