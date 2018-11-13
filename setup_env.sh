#!/bin/bash

mkdir -p $HOME/.bash/

cp -rf ./zshrc ~/.bash/zshrc
source ~/.bash/zshrc

# Delete previous repo
rm -rf $LOCAL_REPO_PATH

git clone  $GITHUB_REPO

cd $LOCAL_REPO_PATH

echo "Coloned locally"

git remote set-url github --add $GITHUB_REPO
git remote set-url gitlab --add $GITLAB_REPO
echo "Origin added"

git remote -v

git config --global url.ssh://git@github.com/.insteadOf https://github.com/
git config --global url.ssh://git@$GITLAB_DOMAIN/.insteadOf https://$GITLAB_DOMAIN/

# back to home directory
cd ../

echo "Setup Completed"
