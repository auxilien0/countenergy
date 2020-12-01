#!/bin/bash
# exec ./start-all.sh;
# awk -F, 'FNR==NR{a[$1]=$2;next} $1 in a{$3=a[$1]} 1' OFS=, csvs/*.csv > new.csv
# awk '!a[$0]++' csvs/*.csv > csvs/0-main.csv
# if [ ! -n "$(git status --porcelain files/csvs-parts)" ]; then
#   echo "changed";
# else
#   echo "no";
# fi

#!/bin/bash
IFS=";"
while read a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 a32
do
  echo "$a1 $a2 $a3 $a4 $a5 $a6 $a7 $a8 $a9 ${a10} ${a11} ${a12} ${a13} ${a14} ${a15} ${a16} ${a17} ${a18} ${a19} ${a20} ${a21} ${a22} ${a23} ${a24} ${a25} ${a26} ${a27} ${a28} ${a29} ${a30} ${a31} ${a32}"
done < 00012866.csv > new.csv
