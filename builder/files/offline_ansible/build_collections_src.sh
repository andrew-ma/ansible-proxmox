#!/bin/bash
SCRIPTDIR="$(dirname "${BASH_SOURCE[0]}")"

[[ ! -d collections ]] && mkdir -p "${SCRIPTDIR}/collections"

find "${SCRIPTDIR}/collections_src" -mindepth 2 -maxdepth 2 -type d -exec bash -c 'pushd {}; ansible-galaxy collection build --force --output-path ../../../collections; popd' \;

