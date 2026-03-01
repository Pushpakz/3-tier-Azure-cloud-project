# 🚀 Cloud-Native 3-Tier Platform on Microsoft Azure  
### AKS | Terraform | Docker | Helm | Azure DevOps | Apache Airflow

---

## 📌 Project Overview

This project demonstrates the design and implementation of a **cloud-native platform on Microsoft Azure** using modern DevOps practices.

It includes:

- Infrastructure as Code (Terraform)
- Azure Kubernetes Service (AKS)
- Azure Container Registry (ACR)
- Docker containerization
- Helm-based Kubernetes deployments
- Azure DevOps CI/CD pipelines
- Apache Airflow deployment

The solution showcases scalability, automation, modular design, and production-grade cloud practices.

---

## 🏗️ Architecture Overview
Azure
│
├── Resource Group
│
├── Azure Container Registry (ACR)
│
├── Azure Kubernetes Service (AKS)
│ ├── Namespace: three-tier
│ │ ├── Frontend (Deployment + Service)
│ │ ├── Backend (Deployment + Service)
│ │ └── PostgreSQL (StatefulSet + PVC)
│ │
│ └── Namespace: airflow
│ ├── Webserver
│ ├── Scheduler
│ ├── Workers
│ ├── Redis
│ └── PostgreSQL
│
└── Azure DevOps
├── CI Pipeline (Build + Push Images)
└── CD Pipeline (Deploy to AKS)

---

## 📁 Repository Structure
azure-cloud-platform/
│
├── terraform/
│ ├── backend.tf
│ ├── providers.tf
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ └── modules/
│ ├── rg/
│ ├── acr/
│ └── aks/
│
├── app/
│ ├── frontend/
│ │ ├── Dockerfile
│ │ ├── index.html
│ │ └── style.css
│ │
│ └── backend/
│ ├── Dockerfile
│ ├── app.py
│ └── requirements.txt
│
├── helm/
│ └── three-tier/
│ ├── Chart.yaml
│ ├── values.yaml
│ └── templates/
│
├── airflow/
│ └── values.yaml
│
└── azure-pipelines/
├── ci.yml
└── cd.yml

---

## 🧱 Infrastructure Provisioning (Terraform)

Infrastructure is provisioned using **modular Terraform design**.

### Resources Created

- Azure Resource Group
- Azure Container Registry (ACR)✔ Modular
✔ Idempotent
✔ Remote backend enabled
✔ Environment-ready structure

🐳 Container Platform
3-Tier Application

1️⃣ Frontend
Nginx-based static UI
Colorful responsive interface
Calls backend API

2️⃣ Backend
Python (Flask REST API)
Exposes health endpoint
Connects to PostgreSQL

3️⃣ Database
PostgreSQL
StatefulSet with Persistent Volume

Build & Push Docker Images
# Frontend
docker build -t <acr-name>.azurecr.io/frontend:latest ./app/frontend
docker push <acr-name>.azurecr.io/frontend:latest

# Backend
docker build -t <acr-name>.azurecr.io/backend:latest ./app/backend
docker push <acr-name>.azurecr.io/backend:latest

☸️ Kubernetes Deployment (Helm)
Helm is used to manage Kubernetes workloads.

Implemented Kubernetes Components
Namespaces
Deployments
StatefulSet
Services
Secrets
Resource Requests & Limits
Horizontal Pod Autoscaler (HPA)

Deploy Application
helm upgrade --install three-tier ./helm/three-tier

🌬️ Apache Airflow Deployment
Apache Airflow is deployed on the same AKS cluster using Helm.

Configuration Includes :
CeleryExecutor
Redis
PostgreSQL
Persistent DAG storage
Persistent logs
LoadBalancer service
Resource limits

Deploy Airflow
helm repo add apache-airflow https://airflow.apache.org
helm repo update

helm upgrade --install airflow apache-airflow/airflow \
  --namespace airflow \
  -f airflow/values.yaml

🔄 CI/CD Implementation (Azure DevOps)
CI Pipeline
Code build
Docker image build
Image push to ACR

CD Pipeline
Helm deployment
Environment-aware configuration
Automated deployment to AKS

Pipelines are:
Modular
Reusable
Environment-ready (dev/stage/prod compatible)

🔐 Security Best Practices
Managed Identity for AKS
ACR admin disabled
Kubernetes Secrets for credentials
Namespace isolation
Resource limits defined
Remote Terraform state

Future enhancements:
Azure Key Vault integration
Network Policies
HTTPS with cert-manager
Pod Security Standards

📈 Scalability & Reliability
Horizontal Pod Autoscaler enabled
CeleryExecutor for scalable Airflow workers
Persistent storage for DB and logs
Decoupled microservice architecture

🧹 Resource Cleanup

To avoid Azure charges:
cd terraform
terraform destroy

Delete remote backend storage:
az group delete --name tfstate-rg --yes

🎯 DevOps Concepts Demonstrated

Infrastructure as Code
Modular Terraform design
Kubernetes orchestration
Helm-based deployment
CI/CD automation
Containerization
Cloud-native architecture
Production-grade DevOps practices

👨‍💻 Author

Pushpak Zambare
DevOps Engineer
Azure | Kubernetes | Terraform | CI/CD | Cloud Automation

🏆 Project Outcome

Successfully designed and deployed a scalable, secure, automated cloud-native platform on Azure using industry-standard DevOps tools and best practices.
  
- Azure Kubernetes Service (AKS)
- Managed Identity
- Remote Backend (Azure Storage for tfstate)

### Deploy Infrastructure

```bash
cd terraform
terraform init
terraform plan
terraform apply

