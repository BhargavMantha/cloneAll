#!/bin/bash
#!!!This is for Internal use only use at your own risk
#optional change working_dir
# working_dir=${1-$(pwd)}
# cd $working_dir

GHUSER="<USERNAME>"
GITHUB_API_PASSWORD="<Password>"
repo_list=$(curl -S --user ${GHUSER}:${GITHUB_API_PASSWORD} \
  https://api.github.com/user/repos?visibility=private |
  grep -e 'clone_url*' | cut -d \" -f 4)

for repo in $repo_list; do
  echo "Repo found: $repo"
  git remote set-url $repo
  git clone $repo
done
