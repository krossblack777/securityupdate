#!/bin/sh -ex

if [ -z $(git status -sb 2> /dev/null | grep Gemfile.lock) ]; then
  exit 0
fi

export BRANCH=bundle-update-$(date -u "+%Y%m%d")

git config --global user.email krossbot@example.com
git config --global user.name 'krossbot'
git add Gemfile.lock
git commit -m '$ bundle update'
git branch -M $BRANCH
git push origin $BRANCH

bundle exec ruby script/create_pull_request.rb
