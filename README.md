# 🔧 Azure Ubuntu VM with Redis, Redis‑UI & NGINX (Terraform)

This project uses Terraform to provision an Ubuntu VM in Azure, installs Redis and Redis‑UI, and configures NGINX as a reverse proxy to serve the Redis‑UI web interface.

---

## 📋 Prerequisites

- Azure CLI (`az`) configured and authenticated
- Terraform v1.x installed
- SSH key configured for VM access

---

## 🚀 Deployment Steps

1. **Initialize Terraform:**
   ```bash
   terraform init