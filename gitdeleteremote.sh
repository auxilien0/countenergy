#!/bin/bash
GIT='git'
# $GIT update-ref -d HEAD
$GIT add .
$GIT rm --cached -f -r files/csvs/ .gitignore cookies credentials data.sh git.sh start-jindra-home.sh start-zs-17-listopadu.sh start-zs-hornicka.sh start.sh test.sh gitdeleteremote.sh gitNotUsed.sh
$GIT commit -m date-`date +%Y-%m-%d_%H:%M:%S`
$GIT push -u remote master -f
