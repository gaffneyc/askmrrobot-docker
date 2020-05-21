#!/bin/sh

current="$(grep -Poe 'universal-\K\d+' Dockerfile)"
upstream="$(curl -s https://www.askmrrobot.com/wow/simulator/client | grep -Poe 'Version \K(\d)+')"

if [ $current != $upstream ]; then
  echo "current:$current upstream:$upstream"

  # Update the version references in the description and download URL.
  # sed -i "s/$current/$upstream/g" Dockerfile
  sed -i "s/\([v|any-]\)$current/\1$upstream/" Dockerfile
  git commit Dockerfile -m "Update client to version $upstream"

  git push
fi
