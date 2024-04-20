#!/usr/bin/env bash
set -o xtrace
set -e

for pkg_dir in /duat/pkg/*; do
  if [ -d "$pkg_dir" ]; then
    if [ -f "$pkg_dir/install.sh" ]; then
      echo "Installing $pkg_dir..."
      bash "$pkg_dir/install.sh"
    else
      echo "No install.sh found in $pkg_dir. Skipping."
    fi
  fi
done
