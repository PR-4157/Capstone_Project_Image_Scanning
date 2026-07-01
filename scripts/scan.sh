#!/bin/bash

# Get the directory where scan.sh is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Load .env from the project root
source "$SCRIPT_DIR/../.env"

echo "Scanning Image..."

trivy image \
  --scanners vuln \
  --timeout 10m \
  --severity "$SEVERITY" \
  --exit-code 1 \
  "$IMAGE_NAME:$IMAGE_TAG"

RESULT=$?

if [ $RESULT -eq 0 ]
then
    echo "✅ No High/Critical Vulnerabilities."
else
    echo "❌ Vulnerabilities Found!"
fi

exit $RESULT