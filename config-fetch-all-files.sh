#!/bin/bash

GIT='git';
$GIT fetch ${2:-remote} master;
$GIT reset --hard FETCH_HEAD;
for f in scripts/start-*.sh; do
  name=$(echo $f | grep -P -o '(?<=start-).*(?=\.sh)');
  id=$(grep -E -o "[0-9]+" scripts/start-$name.sh);
  cat files/csvs-parts/csvs-parts-$name/part_*.csv > "files/csvs/csvs-$name/$id.csv";
done

