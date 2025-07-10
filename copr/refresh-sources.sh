#!/usr/bin/env bash
set -euo pipefail

# download into ~/.cache-builds/rpmbuild/SOURCES
RPMBUILD_ROOT="$HOME/.cache-builds/rpmbuild"
SOURCES_DIR="$RPMBUILD_ROOT/SOURCES"
mkdir -p "$SOURCES_DIR"

# Fetch the latest Vesktop tag
ver="$(gh release view --repo Vencord/Vesktop --json tagName -q .tagName)"
ver_no_v="${ver#v}"

# remove any old RPMs, grab the new ones
rm -f "$SOURCES_DIR"/vesktop-*.rpm
gh release download "$ver" \
  --repo Vencord/Vesktop \
  --pattern 'vesktop-*.rpm' \
  --dir   "$SOURCES_DIR"

echo "Fetched Vesktop $ver into $SOURCES_DIR"
ls -1 "$SOURCES_DIR"/vesktop-*.rpm
