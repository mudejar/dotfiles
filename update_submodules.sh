#!/usr/bin/env bash

echo "Updating all git submodules to latest HEAD"
git submodule update --remote
git add .
git commit -m "Updated submodule(s) to latest commit"
git push
