#!/bin/sh -ex

#export BRANCH=bundle-update-$(date -u "+%Y%m%d")
export BRANCH=security-check

git checkout -b $BRANCH
git config --global user.email krossbot@example.com
git config --global user.name 'krossbot'
git commit --allow-empty -m "make pull request"
git branch -M $BRANCH
git push origin $BRANCH

bundle exec ruby script/create_pr.rb
