#!/bin/bash

set -e

env PATH="/opt/puppetlabs/bin:${PATH}" \
    USER="${USER:=$(id -un)}" \
    HOME="${HOME:=$(getent passwd "$USER" | cut -d : -f 6)}" \
    puppet infrastructure enable replica "$PT_primary_master_replica" \
      --skip-agent-config \
      --topology mono-with-compile \
      --yes
