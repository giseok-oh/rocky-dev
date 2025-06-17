#!/bin/bash

set -e

BASE_DIR="$(pwd)/vagrant"
TARGET="$1"
shift

if [[ "$TARGET" != "kvm" && "$TARGET" != "virtualbox" ]]; then
    echo "Usuage: $0 [kvm|virtualbox] [vagrant command...]"
    exit 1
fi

VM_DIR="$BASE_DIR/$TARGET"

if [ ! -d "$VM_DIR" ]; then
    echo "Error: directory $VM_DIR does not exist."
    exit 1
fi

cd "$VM_DIR"
vagrant "$@"