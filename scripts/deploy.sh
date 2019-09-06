#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# build the project
hugo -t even


# push public dir to github
cd public
git add .

msg="rebuilding site `date`"

if [ $# -eq 1 ]
  then msg="$1"
fi

git commit -m "$msg"
git push origin master

# push blog root dir
cd ..
git add .
git commit -m "$msg"
git push origin master
