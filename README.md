# Container Image Vulnerability Scanner with Trivy

A beginner-friendly DevSecOps project that scans Docker container images for known security vulnerabilities using **Trivy** and generates vulnerability reports.

This project is the foundation for building an automated container security pipeline that can later integrate with GitHub Actions, Jenkins, Slack notifications, and security dashboards.

# Project Overview

Container images often contain operating system packages and application dependencies.

Some of these packages may have publicly known security vulnerabilities called **CVEs (Common Vulnerabilities and Exposures)**.

Before deploying a container into production, it is important to scan the image to identify these vulnerabilities.

This project uses **Trivy**, an open-source vulnerability scanner, to inspect Docker images and generate security reports.

# Project Goals

- Learn the basics of Docker image security.
- Scan container images for known vulnerabilities.
- Generate vulnerability reports.
- Understand CVE severity levels.
- Build the foundation for CI/CD security automation.

# Project Architecture

```
                Docker Image
                     │
                     ▼
             Trivy Vulnerability Scanner
                     │
                     ▼
          Download Latest CVE Database
                     │
                     ▼
         Compare Installed Packages
                     │
                     ▼
          Detect Security Vulnerabilities
                     │
                     ▼
            Generate Security Reports
```

# Project Structure

```
container-vulnerability-scanner/
│
├── reports/
│   ├── nginx-report.json
│   ├── nginx-report.txt
│
├── scripts/
│
├── images/
│
├── README.md
│
└── .gitignore
```
<img width="1942" height="564" alt="image" src="https://github.com/user-attachments/assets/a39743d9-9105-4f64-90b7-cf7284aa37a7" />

# Technologies Used

| Tool | Purpose |
|------|---------|
| Docker | Container Platform |
| Trivy | Vulnerability Scanner |
| Git | Version Control |
| GitHub | Repository Hosting |

# Prerequisites

Install the following tools before running the project.

## Docker

Verify installation
docker --version

Test Docker
docker run hello-world
<img width="1930" height="852" alt="image" src="https://github.com/user-attachments/assets/00bc6460-863b-40d0-8244-ddd622d67cf7" />

## Install Trivy

### macOS

brew install trivy

Verify installation
trivy --version
<img width="1944" height="367" alt="image" src="https://github.com/user-attachments/assets/22f60007-2cbd-4d99-861a-085e2090c94b" />

# Getting Started

Move into the project directory
cd container-vulnerability-scanner
<img width="1937" height="309" alt="image" src="https://github.com/user-attachments/assets/b0027e18-5455-41e0-b942-1f5f918c675e" />

# Pull Sample Docker Images

Download sample images for scanning.
docker pull nginx
<img width="1944" height="537" alt="image" src="https://github.com/user-attachments/assets/95149314-e3ba-48de-8f53-9b6b9e2eeb25" />

docker pull python:3.9
<img width="3024" height="510" alt="image" src="https://github.com/user-attachments/assets/4e2b0631-86b5-4c71-aed6-d4b1d06b9e89" />

docker pull ubuntu:22.04
<img width="3024" height="311" alt="image" src="https://github.com/user-attachments/assets/11a78a9d-e0d4-483a-82ca-0b2e516909a9" />

Verify downloaded images
docker images
<img width="3018" height="478" alt="image" src="https://github.com/user-attachments/assets/7790b823-ff0d-4333-a83c-359067f68465" />

# Scan Docker Images

Scan the Nginx image
trivy image nginx
<img width="3023" height="1845" alt="image" src="https://github.com/user-attachments/assets/9fe6b3bd-199b-4ae3-abfe-aa21b3d6e0b0" />
<img width="3024" height="1858" alt="image" src="https://github.com/user-attachments/assets/de3edfc7-11cf-4ca2-892e-c123dd1a4452" />

Scan Python image
trivy image python:3.9
<img width="3013" height="265" alt="image" src="https://github.com/user-attachments/assets/00093dd3-a0bd-479b-9d6d-191f480d6ed6" />
<img width="3024" height="1808" alt="image" src="https://github.com/user-attachments/assets/8898b4c6-3cbd-4e13-92db-217116504d46" />
<img width="3021" height="1708" alt="image" src="https://github.com/user-attachments/assets/1f2d74ef-d07c-4448-9dc0-81bc8db40489" />
<img width="3024" height="1838" alt="image" src="https://github.com/user-attachments/assets/55337380-cf20-49e9-84fb-2b94111bc357" />

Scan Ubuntu image
trivy image ubuntu:22.04
<img width="3017" height="1849" alt="image" src="https://github.com/user-attachments/assets/9df97077-123b-4ab4-a80a-91215b54cfe6" />
<img width="3024" height="1765" alt="image" src="https://github.com/user-attachments/assets/221d8beb-eb3e-485a-970a-db1f26f1d25b" />
<img width="3023" height="1809" alt="image" src="https://github.com/user-attachments/assets/3d77fab6-49db-4026-9c39-f984773a9e61" />

# Save Scan Reports

Generate JSON report
trivy image nginx -f json -o reports/nginx-report.json

Generate Table report
trivy image nginx -f table -o reports/nginx-report.txt
<img width="2264" height="456" alt="image" src="https://github.com/user-attachments/assets/0d2d7cf4-1ae3-4d59-a51c-491e36b3e68b" />
<img width="3022" height="828" alt="image" src="https://github.com/user-attachments/assets/26477607-1bc4-41df-a0a2-6e68f393ee3e" />

# Example Vulnerability Report

Below is an example of a vulnerability detected by Trivy while scanning the **nginx** Docker image.

```text
Package: curl

Installed Version: 8.14.1-2+deb13u3

Fixed Version: Not Available

Severity: HIGH

CVE: CVE-2026-5773
```

### Explanation

- **Package** – The software package inside the Docker image.
- **Installed Version** – The version currently installed in the image.
- **Fixed Version** – The version that fixes the vulnerability. If blank or "Not Available", no fix has been released yet.
- **Severity** – Indicates how serious the vulnerability is. In this case, it is **HIGH**.
- **CVE** – A unique identifier for the vulnerability (`CVE-2026-5773`).

# Understanding the Report

Each vulnerability contains important information.

| Field | Description |
|--------|-------------|
| Package | Software package inside the image |
| Installed Version | Current installed version |
| Fixed Version | Version where vulnerability is fixed |
| Severity | Risk level of the vulnerability |
| CVE | Unique identifier of the vulnerability |

# Severity Levels

| Severity | Description |
|-----------|-------------|
| LOW | Minor security issue |
| MEDIUM | Should be reviewed |
| HIGH | Serious vulnerability |
| CRITICAL | Immediate action required |

# What is a CVE?

**CVE** stands for **Common Vulnerabilities and Exposures**.

Every publicly known security vulnerability is assigned a unique CVE identifier.

Example
CVE-2026-5773
This allows security teams around the world to identify and track the same vulnerability.

# How Trivy Works

```
Docker Image
      │
      ▼
Read Installed Packages
      │
      ▼
Download Latest CVE Database
      │
      ▼
Compare Package Versions
      │
      ▼
Find Matching Vulnerabilities
      │
      ▼
Generate Report
```
Trivy does not guess vulnerabilities.
It compares installed package versions against a continuously updated vulnerability database.

# Sample Images Tested

| Docker Image | Purpose |
|--------------|---------|
| nginx | Web Server |
| python:3.9 | Python Runtime |
| ubuntu:22.04 | Linux Operating System |


# Sprint 1 Deliverables

- Docker installed
- Trivy installed
- Git repository initialized
- Project folder structure created
- Pulled sample Docker images
- Successfully scanned images
- Generated JSON reports
- Generated Table reports
- Learned CVE severity levels

# Future Improvements

This project will continue with:

- Bash automation scripts
- GitHub Actions integration
- Jenkins CI/CD pipeline
- Severity threshold configuration
- Slack notifications
- Microsoft Teams notifications
- HTML report generation
- Historical vulnerability dashboard

# Conclusion

This project demonstrates the fundamentals of container image security by using **Trivy** to scan Docker images for known vulnerabilities. It shows how security can be integrated into the software development lifecycle by identifying vulnerabilities before applications are deployed to production.

Throughout Sprint 1, the project establishes a strong foundation by installing and configuring Docker and Trivy, scanning multiple container images, understanding vulnerability reports, and generating security reports in both JSON and table formats. These steps provide a practical understanding of how vulnerability scanning works and why it is an essential part of modern DevSecOps practices.

This project is designed to evolve in future sprints. The next phase will focus on automating vulnerability scanning through CI/CD pipelines using GitHub Actions and Jenkins, enforcing security policies based on vulnerability severity, and eventually adding notifications and reporting dashboards for continuous security monitoring.

By completing this project, you gain hands-on experience with container security, vulnerability management, and DevSecOps workflows that are widely used in real-world software development and cloud environments.

