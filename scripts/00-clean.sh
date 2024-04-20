#!/usr/bin/env bash
set -o xtrace

rm -rf build/* deps/* iso/*

for dir in $(ls -d pkg/*); do
  rm -rf $dir/src
done
