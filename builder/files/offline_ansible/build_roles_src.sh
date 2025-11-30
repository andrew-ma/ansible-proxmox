#!/bin/bash
SCRIPTDIR="$(dirname "${BASH_SOURCE[0]}")"

[[ ! -d roles ]] && mkdir -p "${SCRIPTDIR}/roles"

find "${SCRIPTDIR}/roles_src" -mindepth 1 -maxdepth 1 -exec bash -c 'BASENAME="$(basename "{}")"; tar cvzf "roles/${BASENAME}" -C "{}" .' \;

