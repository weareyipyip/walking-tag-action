#!/bin/sh
set -eu

printenv

git_setup ( ) {
  cat <<- EOF > $HOME/.netrc
        machine github.com
        login $GITHUB_ACTOR
        password $GITHUB_TOKEN
        machine api.github.com
        login $GITHUB_ACTOR
        password $GITHUB_TOKEN
EOF
  chmod 600 $HOME/.netrc

  git config --global user.email "actions@github.com"
  git config --global user.name "Github Actions"
}

echo "Setting up git machine..."
git_setup

echo "Forcing tag update..."
git tag -a ${1} -m "${2}" "${GITHUB_SHA}" -f

echo "Forcing tag push..."
git push -f origin refs/tags/${1}