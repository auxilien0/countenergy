#!/bin/bash
# git config credential.helper store
GIT='git';
if [ "$1" = "remote" ]; then
  # $GIT update-ref -d HEAD
  $GIT add files/csvs-parts/
  # $GIT commit -m date-`date +%Y-%m-%d_%H:%M:%S`
  # $GIT push remote master
  # $GIT rm --cached -f .gitignore cookies credentials data.sh git.sh start-jindra-home.sh start-zs-17-listopadu.sh start-zs-hornicka.sh start.sh test.sh
  $GIT commit -m date-`date +%Y-%m-%d_%H:%M:%S`
  $GIT push -u remote master -f
  echo "REMOTE REPO";
else
  $GIT add .
  $GIT reset -- files
  $GIT commit -m date-`date +%Y-%m-%d_%H:%M:%S`
  $GIT push -u origin master -f
  echo "MAIN REPO";
fi
