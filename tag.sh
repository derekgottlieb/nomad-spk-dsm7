#!/bin/bash

source config.sh
git tag -a v${NOMAD_VERSION}-${BUILD_VERSION} -m "Nomad ${NOMAD_VERSION}, SPK build ${BUILD_VERSION}"
git push origin v${NOMAD_VERSION}-${BUILD_VERSION}
