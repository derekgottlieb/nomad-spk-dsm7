#!/bin/bash

VERSION=$1

cat <<EOF
package="nomad"
version="${VERSION}"
os_min_ver="7.0-40000"
description="Workload Orchestration Made Easy"
arch="noarch"
maintainer="Hashicorp"
maintainer_url="https://www.nomadproject.io"
distributor_url="https://github.com/derekgottlieb/nomad-spk-dsm7"
support_url="https://github.com/hashicorp/nomad"
thirdparty="yes"
silent_install="yes"
silent_uninstall="yes"
silent_upgrade="yes"
beta="yes"
EOF
