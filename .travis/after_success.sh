#!/bin/bash
set -e

if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
  npm run coverage
fi

if [[ $TRAVIS_BRANCH == 'master' ]]; then
  echo $TRAVIS_NODE_VERSION
  npm run semantic-release
fi