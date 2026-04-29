#!/usr/bin/env bash
set -euo pipefail
base=$(git -C src merge-base origin/main HEAD)
rm -f patches/*.patch
git -C src format-patch "$base"..HEAD -o ../patches --no-signature --no-stat -N
# git fetch origin && git rebase origin/main
