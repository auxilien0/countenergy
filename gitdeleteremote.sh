#!/bin/bash
GIT='git'
# $GIT update-ref -d HEAD
if [ ! -n "$(git status --porcelain files/csvs-parts)" ]; then
  sleep 120;
  . ./start-all.sh;
fi
$GIT add .
$GIT rm --cached -f .gitignore cookies login-fetch-cookies.sh config-fetch-all-files.sh credentials data.sh git.sh scripts/start-jindra-home.sh scripts/start-zs-17-listopadu.sh scripts/start-zs-hornicka.sh start.sh test.sh gitdeleteremote.sh gitNotUsed.sh start-all.sh
$GIT rm --cached -f -r files/csvs
$GIT rm --cached -f -r scripts
$GIT commit -m date-`date +%Y-%m-%d_%H:%M:%S`
$GIT push -u remote master -f
