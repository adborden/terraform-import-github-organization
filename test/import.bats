#!/usr/bin/env bats

source lib/import.sh

ORG=18f
## TODO stub out curl
API_URL_PREFIX=https://api.github.com

function terraform () {
  # stub out terraform
  :
}

@test "import_users" {
  run import_users
  [ $status -eq 0 ]

  # Check the generated file
  run grep -q 'resource "github_membership"' github-users.tf
  [ $status -eq 0 ]
}
