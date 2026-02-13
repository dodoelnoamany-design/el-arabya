#!/usr/bin/env bash
set -euo pipefail

echo "Pruning workspace for CI build..."
rm -rf dist-electron release build dist al-arabia-inventory-installer-final node_modules
echo "Prune complete."
