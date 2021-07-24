#!/bin/sh
bak_file=$HOME/todoist.zip
token=1234567890abcdef
# Gets the first URL to do the backup
url=$(curl --silent https://api.todoist.com/sync/v8/backups/get -H "Authorization: Bearer $token" | jq '.[0].url' | tr -d '"')
echo "Downloading..."
curl -o $bak_file -L -H "Authorization: Bearer $token" $url
echo "Done!" 
