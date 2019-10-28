#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5db757e511c8200012ea5cc3/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5db757e511c8200012ea5cc3
curl -s -X POST https://api.stackbit.com/project/5db757e511c8200012ea5cc3/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5db757e511c8200012ea5cc3/webhook/build/publish > /dev/null
