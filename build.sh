#!/bin/bash

set -e

source config.sh

for arch in amd64 arm arm64
do
  if [[ ! -f nomad_${NOMAD_VERSION}_linux_${arch}.zip ]]; then
    echo "Downloading nomad ${NOMAD_VERSION} / arch ${arch}"
    wget https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_${arch}.zip
    unzip -d ${arch} nomad_${NOMAD_VERSION}_linux_${arch}.zip
    mv ${arch}/nomad builddir/package/bin/
  fi

  echo "Generating INFO file for nomad ${NOMAD_VERSION} / arch ${arch}"
  ./info.sh ${NOMAD_VERSION}-${BUILD_VERSION} > builddir/INFO

  echo "Building SPK for nomad ${NOMAD_VERSION} / arch ${arch}"
  cd builddir
  tar -cvzf package.tgz package
  tar -cvf ../nomad_${NOMAD_VERSION}_${arch}.spk *
  rm package.tgz
  cd ..
done
