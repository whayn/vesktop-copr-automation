#!/usr/bin/env bash
set -euo pipefail

# Rpmbuild tree
RPMBUILD_ROOT="${RPMBUILD_ROOT:-$PWD/rpmbuild}"
SOURCES_DIR="$RPMBUILD_ROOT/SOURCES"
mkdir -p "$SOURCES_DIR"

# Figure out the latest release tag
ver="$(gh release view --repo Vencord/Vesktop --json tagName -q .tagName)"

# Clear out old RPMs and download fresh ones
rm -f "$SOURCES_DIR"/vesktop-*.rpm
gh release download "$ver" \
  --repo Vencord/Vesktop \
  --pattern 'vesktop-*.rpm' \
  --dir "$SOURCES_DIR"

echo "Fetched Vesktop $ver into $SOURCES_DIR"
ls -1 "$SOURCES_DIR"/vesktop-*.rpm
