#!/bin/bash
# awk -F, 'FNR==NR{a[$1]=$2;next} $1 in a{$3=a[$1]} 1' OFS=, csvs/*.csv > new.csv
awk '!a[$0]++' csvs/*.csv > csvs/0-main.csv
