#!/bin/bash
set -Eeuo pipefail

body=$(cat << EOF
{
    "type": "message",
    "attachments": [
        {
            "contentType": "application/vnd.microsoft.card.adaptive",
            "contentUrl": null,
            "content": {
                "type": "AdaptiveCard",
                "body": [
                    {
                        "type": "TextBlock",
                        "size": "medium",
                        "weight": "bolder",
                        "text": "BO Toolkit pipeline failed"
                    },
                    {
                        "type": "TextBlock",
                        "text": "At least one job in the toolkit pipeline has failed.",
                        "wrap": true
                    },
                    {
                        "type": "TextBlock",
                        "text": "Branch: $GITHUB_REF_NAME",
                        "wrap": true
                    },
                    {
                        "type": "ActionSet",
                        "actions": [
                            {
                                "type": "Action.OpenUrl",
                                "title": "Go to failed workflow run",
                                "uri": "$GITHUB_SERVER_URL/$GITHUB_REPOSITORY/actions/runs/$GITHUB_RUN_ID"
                            }
                        ]
                    }
                ],
                "\$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
                "version": "1.2"
            }
        }
    ]
}
EOF
)

echo "Sending notification to teams channel"
curl --fail -i -X POST "$1" --header "Content-Type: application/json" --data-binary "$body"
echo "Notification was successfully transmitted to teams channel!"
