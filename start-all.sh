#!/bin/bash
# timeout=${1:-86400};
timeout=3600;
while true;
do
  . ./login-fetch-cookies.sh;
  . ./data.sh 00012866 csvs-jindra-home csvs-parts-jindra-home;
  . ./data.sh 00012908 csvs-zs-17-listopadu csvs-parts-zs-17-listopadu;
  . ./data.sh 00012909 csvs-zs-hornicka csvs-parts-zs-hornicka;
  . ./gitdeleteremote.sh;
  date;
  sleep $timeout;
done;
