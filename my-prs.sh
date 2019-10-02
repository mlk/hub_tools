#!/bin/bash

DATA=$(hub  api "search/issues?q=is:open%20is:pr%20review-requested:mlk%20archived:false" | jq -r '.items[] | [{"Title": .title, "URL": .html_url}]')

if [ -z "$DATA" ]; then
  echo "No PRs 🎉"
else
  echo $DATA | in2csv -f json | csvlook
fi


