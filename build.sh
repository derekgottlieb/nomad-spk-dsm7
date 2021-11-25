#!/bin/bash

set -e

source config.sh

if [[ ! -f nomad_${NOMAD_VERSION}_linux_amd64.zip ]]; then
  echo "Downloading nomad ${NOMAD_VERSION}"
  wget https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip
  unzip nomad_${NOMAD_VERSION}_linux_amd64.zip
  mv nomad builddir/package/bin
fi

echo "Generating INFO file"
./info.sh ${NOMAD_VERSION}-${BUILD_VERSION} > builddir/INFO

echo "Building SPK"
cd builddir
tar -cvzf package.tgz package
tar -cvf ../nomad_${NOMAD_VERSION}.spk *
rm package.tgz

echo "SPK available at nomad_${NOMAD_VERSION}.spk"
