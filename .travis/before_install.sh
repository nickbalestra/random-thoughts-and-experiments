#!/bin/bash
set -e
# Note: do not do set -x or the passwords will leak!

if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
  echo "We are in a pull request, not setting up release"
  exit 0
fi

if [[ $TRAVIS_BRANCH == 'master' ]]; then
  # rm -rf .
  # git init
  # git clean -dfx
  # git remote add origin https://github.com/opencomponents/base-templates.git
  # git fetch origin
  # git clone https://github.com/$TRAVIS_REPO_SLUG.git $TRAVIS_REPO_SLUG
  # cd $TRAVIS_REPO_SLUG
  # git checkout $TRAVIS_BRANCH

  git config credential.helper store
  echo "https://${RELEASE_GH_USERNAME}:${RELEASE_GH_TOKEN}@github.com/nickbalestra/random-thoughts-and-experiments.git" > ~/.git-credentials

  npm config set //registry.npmjs.org/:_authToken=$NPM_TOKEN -q
  npm prune

  git config --global user.email "nick@balestra.ch"
  git config --global user.name "Nick Balestra"
  git config --global push.default simple

  git fetch --tags
  # git branch -u origin/$TRAVIS_BRANCH
  # git fsck --full #debug
  echo "npm whoami"
  npm whoami #debug
  echo "git config --list"
  git config --list #debug
fi