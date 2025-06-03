# Blue-Green Deployment with AWS EC2 & ELB (Manual + CI/CD Option)

This project demonstrates a Blue-Green deployment setup using AWS EC2 and Elastic Load Balancer (ALB).

## 🔧 Setup

- Two EC2 instances:
  - **Blue (Live)** — current app version
  - **Green (Test)** — new version

- **AWS ALB**:
  - Listener with two target groups: TG-Blue and TG-Green
  - Initially points to TG-Blue

## 🚀 Deployment Steps (Manual)

1. Push code to GitHub
2. SSH or `scp` to copy code to Green EC2
3. Test app on Green EC2
4. Update ELB listener to point to TG-Green

## ⚙️ CI/CD Option (Optional)

A Jenkins pipeline can automate deployment:
- Pulls from GitHub
- Deploys to Green
- Switches traffic via ELB if health check passes

## 📂 Files

- `index.html` – Sample application code
- `scripts/deploy-to-green.sh` – Deploys to Green EC2
- `elb-switch-instructions.md` – Manual steps to switch traffic in AWS Console


