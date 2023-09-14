#!/bin/bash
# https://cdn.onepiecechapters.com/file/opctcb/onepiece/onepiecechapters

for n in $(seq "$2"); do
  printf '          "https://cdn.onepiecechapters.com/file/opctcb/onepiece/onepiecechapters_%02d_%02d.jpg"' "$1" "$n"
  if (( n == $2 )); then
    printf "\n"
  else
    printf ',\n'
  fi
done
