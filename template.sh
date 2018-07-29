#!/bin/sh
set -e

# Get the versions to template.
# If they are passed as args
if [ $# -gt 0 ]; then
  buildDirs="$@"
else
  # else, get all the relevant dirs
  buildDirs=$(ls -1 | grep -E '^[0-9]' | grep -Ev '4|6')
fi

# Build each one of them
for version in $buildDirs; do
  pushd $version > /dev/null
  echo "Templating Version: $version"
  echo "# This file is generated from ../Dockerfile.template.\n# To update this file run go to repo root and run './template.sh $version'." > Dockerfile
  sed \
	-E 's!%%NODE_VERSION%%!'$version'!g' \
	../Dockerfile.template >> Dockerfile
  cp -R ../common/* .
  popd > /dev/null
done
