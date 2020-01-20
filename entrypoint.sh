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
git tag -a ${INPUT_TAG_NAME} -m "${INPUT_TAG_MESSAGE}" "${GITHUB_SHA}" -f

echo "Forcing tag push..."
git push -f origin refs/tags/${INPUT_TAG_NAME}