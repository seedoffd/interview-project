#!/usr/bin/env bash

# Example Values
# deployment_environment = "dev"
# deployment_name        = "exam-platform"
# credentials            = "./fuchicorp-service-account.json"

wget --quiet "https://raw.githubusercontent.com/fuchicorp/common_scripts/master/set-environments/terraform/google-set-env.sh" \
  -O set-env >/dev/null
source 'set-env' "$@"
rm -rf "set-env"
