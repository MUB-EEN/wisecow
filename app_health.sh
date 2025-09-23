#!/bin/bash

# HTTPS URL of your app
APP_URL="https://wisecow.local/"

# Get HTTP status code (follow redirects)
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" -k -L $APP_URL)

# Report status
if [ "$STATUS_CODE" -eq 200 ]; then
    echo "Application is UP (HTTP $STATUS_CODE)"
else
    echo "Application is DOWN (HTTP $STATUS_CODE)"
fi

