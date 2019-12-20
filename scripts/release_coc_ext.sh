#! /usr/local/bin/bash

version=$(json version < package.json)
name=$(json name < package.json)
echo "$name/$version"
git commit -a -m "Release $version"
git tag -a "$version" -m "Release $version"
npm publish
git push --tags
git push
