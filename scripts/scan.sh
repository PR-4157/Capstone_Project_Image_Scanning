#!/bin/bash

echo "===================================="
echo "Starting Trivy Vulnerability Scan..."
echo "===================================="

# Create reports directory if it doesn't exist
mkdir -p reports

# Image to scan
IMAGE_NAME="nginx"

# Generate JSON report
trivy image --scanners vuln \
    -f json \
    -o reports/nginx-report.json \
    "$IMAGE_NAME"

# Generate Table report
trivy image --scanners vuln \
    -f table \
    -o reports/nginx-report.txt \
    "$IMAGE_NAME"

echo ""
echo "===================================="
echo "Scan completed successfully!"
echo "Reports saved in reports/"
echo "===================================="