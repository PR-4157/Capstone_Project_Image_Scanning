# Sprint 1: Docker Image Vulnerability Scanning

## Sprint Objective

The objective of Sprint 1 is to set up the project environment and perform the first vulnerability scan on Docker container images using **Trivy**. This sprint establishes the foundation for integrating automated security scanning into CI/CD pipelines in later stages of the project.

## Learning Outcomes

By completing Sprint 1, you will:

* Understand the purpose of container image vulnerability scanning.
* Learn how Trivy detects known vulnerabilities (CVEs).
* Scan Docker images for security issues.
* Generate vulnerability reports in JSON format.
* Organize the project with a clean directory structure.
* Prepare the project for future CI/CD integration.

## Prerequisites

Before starting, ensure the following tools are installed:

* Docker Desktop
* Git
* Homebrew (macOS)
* Trivy
* Visual Studio Code (Recommended)

Verify the installations:

docker --version
git --version
trivy --version


## Project Structure

container-vulnerability-scanner/
│
├── reports/
│   └── nginx-report.json
│
├── scripts/
│
├── images/
│
├── README.md
│
└── .gitignore

## Step 1: Create the Project

Create a new project directory.

mkdir container-vulnerability-scanner
cd container-vulnerability-scanner

## Step 2: Initialize Git Repository

Initialize Git to track project changes.

git init

## Step 3: Install Trivy

Install Trivy using Homebrew.

brew install trivy

Verify the installation.

trivy --version


## Step 4: Pull a Sample Docker Image

Download a public Docker image.

docker pull nginx

You can also use:

docker pull python:3.11

or

docker pull ubuntu:22.04

## Step 5: Verify Downloaded Images

List all locally available Docker images.

docker images

Example:

REPOSITORY    TAG

nginx         latest
python        3.11

## Step 6: Scan the Docker Image

Run a vulnerability scan using Trivy.

trivy image nginx

Trivy scans every package inside the Docker image and compares installed versions against the latest CVE database.

## Step 7: Review Scan Results

Example summary:

Total: 15

LOW: 6

MEDIUM: 4

HIGH: 4

CRITICAL: 1

Each vulnerability includes:

* Vulnerability ID (CVE)
* Affected Package
* Installed Version
* Fixed Version
* Severity Level

Example:

Package: OpenSSL

CVE: CVE-2024-12345

Installed Version: 3.0.5

Fixed Version: 3.0.12

Severity: HIGH

## Step 8: Save Scan Report

Create the reports directory.

mkdir reports

Generate a JSON report.

trivy image -f json -o reports/nginx-report.json nginx

The generated report will be available at:

reports/nginx-report.json

## Step 9: View the Report

Open the report in Visual Studio Code.

Example JSON output:

{
  "VulnerabilityID": "CVE-2024-12345",
  "PkgName": "openssl",
  "InstalledVersion": "3.0.5",
  "FixedVersion": "3.0.12",
  "Severity": "HIGH"
}

## Understanding CVEs

A **Common Vulnerabilities and Exposures (CVE)** identifier represents a publicly disclosed security vulnerability.

Trivy continuously updates its vulnerability database to detect newly discovered security issues during image scans.

## Sprint 1 Workflow

Create Project
       │
       ▼
Initialize Git Repository
       │
       ▼
Install Docker & Trivy
       │
       ▼
Pull Docker Image
       │
       ▼
Run Trivy Scan
       │
       ▼
Review Vulnerabilities
       │
       ▼
Generate JSON Report
       │
       ▼
Sprint 1 Complete ✅

## Sprint 1 Deliverables

* Project repository created
* Organized folder structure
* Git repository initialized
* Trivy installed successfully
* Docker image downloaded
* Vulnerability scan completed
* JSON vulnerability report generated
* Basic understanding of CVE-based image scanning

## Next Sprint

In **Sprint 2**, the vulnerability scanning process will be automated using **GitHub Actions** and **Jenkins**. Security policies will be enforced so that CI/CD pipelines automatically fail when High or Critical vulnerabilities are detected before deployment.
