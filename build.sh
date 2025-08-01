#!/bin/bash

set -e

VERSION=${1:-2.44.0}

mkdir -p artifacts

echo "🔨 Building for Ubuntu..."
docker build --build-arg GIT_VERSION=$VERSION -f Dockerfile.ubuntu -t git-build-ubuntu .
docker cp $(docker create git-build-ubuntu):/git-${VERSION}-ubuntu.tar.gz artifacts/

echo "🔁 Copying Ubuntu build for Debian..."
cp artifacts/git-${VERSION}-ubuntu.tar.gz artifacts/git-${VERSION}-debian.tar.gz


echo "🔨 Building for rocky8 ..."
docker build --build-arg GIT_VERSION=$VERSION -f Dockerfile.rocky8 -t git-build-rocky .
docker cp $(docker create git-build-rocky):/git-${VERSION}-rocky8.tar.gz artifacts/


echo "✅ All builds complete. Check the artifacts/ directory."
