#!/bin/bash
GIT='git'
$GIT add .
$GIT rm --cached -f -r files/
$GIT commit -m date-`date +%Y-%m-%d_%H:%M:%S`
$GIT push -u bit master -f
