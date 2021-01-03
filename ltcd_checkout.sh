#!/bin/bash

EACD_COMMIT=$(cat go.mod | \
        grep github.com/eacsuite/eacd | \
        tail -n1 | \
        awk -F " " '{ print $2 }' | \
        awk -F "/" '{ print $1 }')
echo "Fetching eacd at $EACD_COMMIT"

pushd /tmp
GO111MODULE=on go get -v github.com/eacsuite/eacd@$EACD_COMMIT
popd
