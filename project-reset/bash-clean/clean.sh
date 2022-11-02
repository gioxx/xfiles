#!/bin/bash
# NoAds X Files "Project Reset"
# GSolone (2022) for NoAds.it

while read line; do
  echo "Cerco ed elimino $line"
  sed "/$line/d" -i "source.txt"
done < inactive.txt
