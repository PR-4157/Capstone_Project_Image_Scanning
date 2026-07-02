# Docker Image Vulnerability Scanner with Reporting

## Final Capstone Project

**Project Assigned By:** HeroVired Virtual Education
**Program:** PPMCAD – Batch 15

### Team Members

* Fancy
* Saima
* Rahul Kumar

# Project Overview

As containerized applications become the industry standard, securing container images before deployment is essential. Vulnerable images can introduce security risks into production environments, leading to potential attacks and compliance issues.

This project develops an **automated Docker Image Vulnerability Scanner** that integrates with CI/CD pipelines to ensure container images are continuously scanned for known security vulnerabilities before deployment.

The solution uses **Trivy** to scan Docker images against the latest **CVE (Common Vulnerabilities and Exposures)** database and generates detailed reports. It also supports automated execution through **GitHub Actions** and **Jenkins**, helping DevOps teams adopt security as part of their CI/CD workflow.

# Problem Statement

Modern DevOps teams frequently build and deploy containerized applications. However, security validation is often performed manually—or not at all—which increases the risk of deploying vulnerable container images into production.

This project addresses that challenge by automating container image vulnerability scanning, integrating security checks directly into CI/CD pipelines, generating vulnerability reports, and providing actionable insights to developers before deployment.

# Project Goals

The project aims to:

* Automate vulnerability scanning of Docker container images.
* Detect known vulnerabilities using the latest CVE database.
* Integrate security scanning into CI/CD pipelines using GitHub Actions and Jenkins.
* Fail builds automatically when High or Critical vulnerabilities are detected.
* Generate detailed vulnerability reports in JSON and HTML formats.
* Send real-time notifications (Slack or Microsoft Teams integration ready).
* Maintain historical scan reports for future auditing and analysis.
* Improve DevSecOps practices by shifting security checks earlier in the software development lifecycle.

# Final Objectives

The Docker Image Vulnerability Scanner provides an end-to-end DevSecOps solution by:

* Scanning Docker images automatically before deployment.
* Integrating seamlessly with GitHub Actions and Jenkins pipelines.
* Detecting vulnerabilities using Trivy and the CVE database.
* Generating comprehensive vulnerability reports.
* Enforcing security policies by preventing deployment of vulnerable images.
* Supporting notification mechanisms for rapid incident response.
* Laying the foundation for a dashboard to visualize vulnerability history and remediation progress.


# Technologies Used

* Docker
* Trivy
* GitHub Actions
* Jenkins
* Bash Shell Scripting
* Python
* Git & GitHub
* CVE Database
* Slack / Microsoft Teams (Notification Support)

# Project Features

* ✅ Docker Image Vulnerability Scanning
* ✅ CI/CD Pipeline Integration
* ✅ Automated Security Gates
* ✅ Severity Threshold Configuration
* ✅ JSON & HTML Report Generation
* ✅ Historical Report Storage
* ✅ Notification Support
* ✅ DevSecOps Best Practices


# Expected Outcome

By implementing this solution, DevOps teams can automatically detect vulnerabilities before production deployment, reduce security risks, and integrate security seamlessly into their continuous integration and continuous deployment workflows.

This project demonstrates practical implementation of **DevSecOps** principles through automated container image security scanning and reporting.
