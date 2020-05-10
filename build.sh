#!/bin/bash
set -x

go build ./...
if [[ $? != 0 ]]; then
    exit 1
fi

go test ./...
if [[ $? != 0 ]]; then
    exit 1
fi

goimports -l .
if [[$? != 0]]; then
    exit 1
fi

echo "build.sh success"