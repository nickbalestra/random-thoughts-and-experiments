#!/bin/bash
set -e

if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
  npm run coverage
fi

if [ $TRAVIS_BRANCH == 'master' ]; then
  if [ $TRAVIS_NODE_VERSION == '8' ]; then
    npm run semantic-release
  fi
fi