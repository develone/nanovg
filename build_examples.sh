#!/bin/bash
#build_examples.sh : located in nanovg root directory
mkdir -p build/examples && cd build/examples

for entry in `ls ../../example/*.c`; do
    entry_name=`echo "$entry" | awk -F"/" '{print substr($0, length($0)+1-length($NF))}' | rev | awk -F"." '{print substr($0,length($0)+1-length($NF))}' | rev`
    #echo "$entry_name"
    gcc "$entry" ../../example/demo.c ../../example/perf.c -I../../example -I../../src -L../../ -L.. -lnanovg -lm -lEGL -lGL -lglfw3  -lXxf86vm -lXrandr -lpthread -lXi -ldl -o "$entry_name"
done

