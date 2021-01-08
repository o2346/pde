#!/bin/bash

cd $(dirname $(realpath $0))

declare -r fundamental='fundamental'
declare -r partial=$1

#https://stackoverflow.com/a/3717989
# example: cat install.yml | awk '
cat -                 |
awk '/\\begin{(test|exam)}/,/\\end{(test|exam)}/'

