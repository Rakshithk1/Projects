# 🔐 Secure CI/CD Pipeline with Jenkins, Trivy, and AWS Secrets Manager

This project demonstrates a secure CI/CD pipeline designed to automate application deployments on AWS while enforcing security and compliance standards.

## 🚀 Overview

The pipeline performs the following tasks:
- Pulls code from GitHub
- Builds a Docker image
- Scans the image for vulnerabilities using **Trivy**
- Retrieves secrets from **AWS Secrets Manager**
- Deploys the application to **AWS EC2**
- Optionally performs a health check and sends notifications

---

## 🧰 Tools & Technologies

| Tool | Purpose |
|------|---------|
| Jenkins | CI/CD pipeline orchestration |
| GitHub | Source control |
| Docker | Containerization |
| Trivy | Vulnerability scanning |
| AWS Secrets Manager | Secure secrets retrieval |
| EC2 | Application hosting |

---

## 📂 Project Structure




---

## 🔁 Pipeline Steps

1. **Clone Repository**
   Jenkins pulls the latest code from GitHub.

2. **Build Docker Image**
   Application is containerized using the provided Dockerfile.

3. **Trivy Scan**
   - Scans the Docker image for vulnerabilities.
   - Generates an HTML/JSON report.

4. **Secrets Retrieval**
   - Uses `aws secretsmanager get-secret-value` to securely fetch secrets.
   - Secrets are injected as environment variables.

5. **Deploy to EC2**
   - Uses SSH or SCP to deploy the application.
   - Optionally uses `docker run` on EC2.

6. **Post-deployment Health Check**
   - Optional curl request or monitoring check.

---

## 🔒 Security Features

- **No hardcoded secrets** — everything is pulled from AWS Secrets Manager.
- **Automated vulnerability detection** using Trivy.
- **Environment isolation** using Docker containers.

---

## 📜 Requirements

- Jenkins installed and configured
- AWS CLI configured with permissions for Secrets Manager and EC2
- Trivy installed on Jenkins host
- IAM roles or access keys securely managed

---

## 🧪 Sample Trivy Command

```bash
trivy image my-app:latest --format html -o trivy-report.html

