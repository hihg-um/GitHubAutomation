#!/bin/bash
# Dispatch a Workflow
set -x

# "github_pat_1234ABC"
GH_PAT=$1

# "thebigcorporation/GitHubAutomation"
REPO=$2

# "build.yml"
WFID=$3

# main | v1.2.3 | SHA
REF=$4

# Inputs initially omitted

# Example from:
# https://docs.github.com/en/rest/actions/workflows?apiVersion=2022-11-28
#
# curl -L \
#   -X POST \
#   -H "Accept: application/vnd.github+json" \
#   -H "Authorization: Bearer $GH_PAT" \
#   -H "X-GitHub-Api-Version: 2022-11-28" \
#   https://api.github.com/repos/${REPO}/actions/workflows/${WFID}/dispatches \
#   -d '{"ref":"topic-branch","inputs":{"name":"Mona the Octocat","home":"San Francisco, CA"}}'

curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${GH_PAT}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/${REPO}/actions/workflows/${WFID}/dispatches \
  -d '{"ref":"$REF"}'
