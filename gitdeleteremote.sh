#!/bin/bash
GIT='git'
# $GIT update-ref -d HEAD
if [ ! -n "$(git status --porcelain files/csvs-parts)" ]; then
  exec ./start-all.sh;
fi
$GIT add .
$GIT rm --cached -f .gitignore cookies credentials data.sh git.sh start-jindra-home.sh start-zs-17-listopadu.sh start-zs-hornicka.sh start.sh test.sh gitdeleteremote.sh gitNotUsed.sh start-all.sh
$GIT rm --cached -f -r files/csvs
$GIT commit -m date-`date +%Y-%m-%d_%H:%M:%S`
$GIT push -u remote master -f
