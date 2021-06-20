#!/bin/bash

echo '#!/bin/bash'
echo 'readonly pwd=$PWD'
find $PWD -type f -name config | grep '.git/config' | while read gitconfig; do
  cd "$(dirname $(dirname $gitconfig))"
  remote_origin_url=$(git config --get remote.origin.url)
  local_toplevel_name=$(basename `git rev-parse --show-toplevel`)
  remote_origin_url_basename=`basename $(echo $remote_origin_url | tr ':' '/')`
  if [ "$local_toplevel_name" = "$remote_origin_url_basename" ]; then
    local_toplevel_name=''
  fi
  echo "git clone $remote_origin_url $local_toplevel_name"
done | sort

echo 'ls $pwd | while read repo; do cd $pwd/$repo; git checkout develop; done'
