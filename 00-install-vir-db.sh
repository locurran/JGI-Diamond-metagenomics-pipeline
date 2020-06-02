#!/bin/bash
# install databases VirSorter requires
# run from info/

wget https://zenodo.org/record/1168727/files/virsorter-data-v2.tar.gz

github="dd12af7d13da0a85df0a9106e9346b45  virsorter-data-v2.tar.gz"
download=$( md5sum virsorter-data-v2.tar.gz )

if [ "$github" = "$download" ]; then
    tar -xvzf virsorter-data-v2.tar.gz
    echo md5sum checked and virsorter extracted
else
    echo md5sums do not match
fi
