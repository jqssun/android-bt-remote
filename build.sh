#!/usr/bin/env bash
set -euo pipefail
rm -rf .git/modules/src/rebase-apply
cd src
git am --whitespace=nowarn --keep-non-patch ../patches/*.patch
# git reset --hard ORIG_HEAD && git clean -fdx