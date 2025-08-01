#!/bin/bash

set -e

# Load .env
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

VERSION=${GIT_VERSION:-2.44.0}
URL="https://mirrors.edge.kernel.org/pub/software/scm/git/git-${VERSION}.tar.gz"

mkdir -p artifacts

echo "🔨 Building for Ubuntu..."
docker build --build-arg GIT_VERSION=$VERSION --build-arg DOWNLOAD_URL=$URL -f Dockerfile.ubuntu -t git-build-ubuntu .
docker cp $(docker create git-build-ubuntu):/git-${VERSION}-ubuntu.tar.gz artifacts/

echo "🔁 Copying Ubuntu build for Debian..."
cp artifacts/git-${VERSION}-ubuntu.tar.gz artifacts/git-${VERSION}-debian.tar.gz

echo "🔨 Building for Rocky..."
docker build --build-arg GIT_VERSION=$VERSION --build-arg DOWNLOAD_URL=$URL -f Dockerfile.rocky -t git-build-rocky .
docker cp $(docker create git-build-rocky):/git-${VERSION}-rocky.tar.gz artifacts/


echo "✅ All builds complete. Check the artifacts/ directory."
