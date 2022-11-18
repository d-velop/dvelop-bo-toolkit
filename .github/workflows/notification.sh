#!/bin/bash
set -Eeuo pipefail

body=$(cat << EOF
{
    "@context": "https://schema.org/extensions",
    "@type": "MessageCard",
    "themeColor": "DF0909",
    "title": "BO Toolkit pipeline failed",
    "text": "<p>At least one job in the toolkit pipeline has failed</p>",
    "potentialAction": [
        {
            "@type": "OpenUri",
            "name": "Go to failed workflow run",
            "targets": [
                {
                    "os": "default",
                    "uri": "$GITHUB_SERVER_URL/$GITHUB_REPOSITORY/actions/runs/$GITHUB_RUN_ID"
                }
            ]
        }
    ]
}
EOF
)

echo "Sending notification to teams channel"
curl --fail -i -X POST "$1" --header "Content-Type: application/json" --data-binary "$body"
echo "Notification was successfully transmitted to teams channel!"
