#!/bin/bash

cd conf

pip install -r requirements.txt
pip install -r requirements.git.txt

cat requirements.git.txt | cut -d/ -f5 | cut -d@ -f1 > ignore.txt
pip freeze | grep -v -f ignore.txt > requirements.frozen.txt

echo > requirements.txt
pip install hashin
hashin $(cat requirements.frozen.txt)

echo
cat requirements.txt
echo
