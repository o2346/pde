#!/bin/bash

cd $(dirname $(realpath $0))

declare -r fundamental='fundamental'
declare -r partial=$1
declare -r fromto='('$(echo "$fundamental $*" | tr ' ' '|')')'
echo $fromto >&2
#\documentclass{custom-partializer-incompatible}
#test: git ls-tree --name-only HEAD | ciwl 'cat install.yml | ./partialize.sh test'
#https://stackoverflow.com/a/3717989
#https://stackoverflow.com/questions/3717772/regex-grep-for-multi-line-search-needed
# example: cat install.yml | awk '/\\begin{(test|exam)}/,/\\end{(test|exam)}/'
#https://en.wikibooks.org/wiki/LaTeX/Basics
cat -                 |
grep  -Pzo '(?s).*\\documentclass{custom-partializer-incompatible}.*' |
awk '/\\begin{'$fromto'}/,/\\end{'$fromto'}/'

exit "`echo "${PIPESTATUS[*]}" | tr ' ' '+' | bc`"


