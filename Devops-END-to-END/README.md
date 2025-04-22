devops-end-to-end-project/
│
├── terraform_files/              # Contains Terraform configuration files
│   ├── main.tf                   # Defines EC2 instance and related infra
│   ├── variables.tf              # Declares input variables for Terraform
│   ├── output.tf                 # Displays output values (e.g., IPs)
│   ├── provider.tf               # AWS provider config
│   └── myaws                     # AWS credentials (ignored in .gitignore)
│
├── Ansible_file/
│   └── install_server            # Ansible playbook to set up the EC2 server
│
├── prometheus/
│   └── install                   # Script to install and configure Prometheus
│
├── grafana/
│   └── install                   # Script to install and configure Grafana
│
├── set                           # Combined setup script for Jenkins, Prometheus & Grafana
└── README.md                     # You're here!


*****************************************************************************


Tools & Technologies Used

AWS EC2 – Infrastructure

Terraform – Infrastructure as Code

Ansible – Configuration Management

Jenkins – CI/CD Automation

Prometheus – Monitoring & Alerting

Grafana – Visualization

Git & GitHub – Version Control

***********************************************************************

Workflow Overview
Terraform provisions EC2 instances on AWS.

Jenkins Freestyle job pulls Terraform code from GitHub and triggers infra build.

Once instances are ready, Ansible installs necessary software like Apache, Prometheus, and Grafana.

Prometheus scrapes metrics from the target servers.

Grafana visualizes these metrics via dashboards.


