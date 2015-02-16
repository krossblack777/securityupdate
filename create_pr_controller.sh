#!/bin/sh -ex

export BRANCH=bundle-update-$(date -u "+%Y%m%d")

git config  user.email krossbot@example.com
git config  user.name 'krossbot'
git checkout -b $BRANCH
git commit --allow-empty -m "make pull request"
git push origin $BRANCH

bundle exec ruby script/create_pr.rb
