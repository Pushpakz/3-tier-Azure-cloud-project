🚀 Cloud-Native 3-Tier Platform on Microsoft Azure (AKS + Terraform + CI/CD)
📌 Project Overview

This project demonstrates the design and implementation of a cloud-native platform on Microsoft Azure using:

Infrastructure as Code (Terraform)

Azure Kubernetes Service (AKS)

Docker containers

Azure Container Registry (ACR)

Helm

Azure DevOps CI/CD

Apache Airflow

The solution reflects modern DevOps best practices including scalability, security, automation, idempotency, and modular architecture.

🏗️ Architecture Overview
Azure
│
├── Resource Group
│
├── Azure Container Registry (ACR)
│
├── Azure Kubernetes Service (AKS)
│   ├── Namespace: three-tier
│   │    ├── Frontend (Deployment + Service)
│   │    ├── Backend (Deployment + Service)
│   │    └── PostgreSQL (StatefulSet + PVC)
│   │
│   └── Namespace: airflow
│        ├── Webserver
│        ├── Scheduler
│        ├── Workers
│        ├── Redis
│        └── PostgreSQL
│
└── Azure DevOps
     ├── CI Pipeline (Build + Push Images)
     └── CD Pipeline (Deploy to AKS)
📁 Repository Structure
azure-cloud-platform/
│
├── terraform/
│   ├── backend.tf
│   ├── providers.tf
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── modules/
│       ├── rg/
│       ├── acr/
│       └── aks/
│
├── app/
│   ├── frontend/
│   │   ├── Dockerfile
│   │   ├── index.html
│   │   └── style.css
│   │
│   └── backend/
│       ├── Dockerfile
│       ├── app.py
│       └── requirements.txt
│
├── helm/
│   └── three-tier/
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
│
├── airflow/
│   └── values.yaml
│
└── azure-pipelines/
    ├── ci.yml
    └── cd.yml
🧱 Infrastructure Provisioning

Infrastructure is provisioned using Terraform (modular approach).

Resources Created

Azure Resource Group

Azure Container Registry (ACR)

Azure Kubernetes Service (AKS)

System-assigned managed identity

Remote backend for Terraform state

Deployment Commands
cd terraform
terraform init
terraform plan
terraform apply

Infrastructure is:

Modular

Environment-ready

Idempotent

Using remote backend state

🐳 Container Platform
3-Tier Application
1️⃣ Frontend

Nginx-based static UI

Colorful responsive UI

Communicates with backend API

2️⃣ Backend

Python (Flask)

REST API

Connects to PostgreSQL

3️⃣ Database

PostgreSQL

StatefulSet with persistent storage

Docker Build & Push
docker build -t <acr-name>.azurecr.io/frontend:latest ./app/frontend
docker push <acr-name>.azurecr.io/frontend:latest

docker build -t <acr-name>.azurecr.io/backend:latest ./app/backend
docker push <acr-name>.azurecr.io/backend:latest
☸️ Kubernetes Deployment

Deployment is managed using Helm Charts.

Features Implemented

Namespace isolation

Deployments

StatefulSet (PostgreSQL)

Services (ClusterIP / LoadBalancer)

Kubernetes Secrets

Horizontal Pod Autoscaler (HPA)

Resource requests & limits

Deploy Application
helm upgrade --install three-tier ./helm/three-tier
🌬️ Apache Airflow Deployment

Airflow is deployed on the same AKS cluster using Helm.

Configuration Includes

CeleryExecutor

Redis

PostgreSQL

Persistent DAG storage

Persistent logs

LoadBalancer service

Resource limits

Disabled example DAGs

Install Command
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

Environment-aware

AKS deployment automation

Pipelines are:

Modular

Reusable

Environment-aware (dev/stage/prod ready)

🔐 Security Best Practices

No hardcoded credentials

Kubernetes Secrets for DB credentials

Managed Identity for AKS

ACR admin disabled

Namespace isolation

Resource limits defined

Future Improvements:

Azure Key Vault integration

Pod Security Policies

Network Policies

HTTPS via cert-manager

📈 Scalability & Reliability

Horizontal Pod Autoscaler enabled

Resource requests & limits defined

Stateful database with persistent volume

Decoupled services

CeleryExecutor for scalable Airflow workers

🔎 Observability (Extendable)

Project designed to support:

Prometheus

Grafana

Azure Monitor

Log Analytics

🧹 Resource Cleanup

To avoid Azure charges:

cd terraform
terraform destroy

Delete remote state:

az group delete --name tfstate-rg --yes
🎯 Key DevOps Concepts Demonstrated

Infrastructure as Code (Terraform)

Modular Terraform design

Kubernetes workload management

Helm-based deployments

CI/CD automation

Containerization

Cloud-native architecture

Production-grade best practices

👨‍💻 Author

Pushpak Zambare
DevOps Engineer
Cloud | Kubernetes | Terraform | CI/CD | Azure

🏆 Project Outcome

Successfully designed and deployed a scalable, secure, automated cloud-native platform on Azure using industry-standard DevOps tools and practices.
