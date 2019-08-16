# Users
import_users () {
  for i in $(curl -s "${API_URL_PREFIX}/orgs/${ORG}/members?access_token=${GITHUB_TOKEN}&per_page=100" | jq -r 'sort_by(.login) | .[] | .login'); do

  cat >> github-users.tf << EOF
resource "github_membership" "${i}" {
  username        = "${i}"
  role            = "member"
}
EOF
    terraform import "github_membership.${i}" "${ORG}:${i}"
  done
}
