#!/bin/bash
GIT='git'
$GIT add .
$GIT reset -- files
$GIT commit -m date-`date +%Y-%m-%d_%H:%M:%S`
$GIT push -u origin master -f
