# Azure VM Docker Nginx Redis Redis UI Project

🚀 *Deploy Nginx + Redis + Redis Insight UI on Azure VM using Docker for practical DevOps learning and scalable lab setup.*

---

## 📌 *Project Overview*

This project:
- Provisions an *Azure Linux VM*.
- Installs *Docker* and *Docker Compose*.
- Deploys:
  - *Nginx* (reverse proxy)
  - *Redis* (key-value store)
  - *Redis Insight UI* (Redis monitoring dashboard)
- Exposes required ports to access the services from your local system or a browser.

---

## 🪐 *Tech Stack*

- *Azure VM (Linux)* (Ubuntu/Debian)
- *Terraform (for IAC in advanced steps)*
- *Docker + Docker Compose*
- *Nginx*
- *Redis*
- *Redis Insight UI*

---

## 🗂️ *Project Structure*
/azure-docker-redis-lab
├── docker-compose.yml
├── nginx/
│   └── default.conf
├── init-script.sh (optional for cloud-init)
└── README.md

## ⚙️ *Services and Ports*

| Service          | Container Port | Host Port (example) |
|-------------------|----------------|----------------------|
| Nginx             | 80             | 8080                 |
| Redis             | 6379           | 6379                 |
| Redis Insight UI  | 8001           | 8001                 |

---

## 🚀 *How to Run Locally*

1️⃣ *Clone the repository*
```bash
git clone https://github.com/nirnayreddy2/azure-docker-redis-lab.git
cd azure-docker-redis-lab

2️⃣ Run with Docker Compose
docker-compose up -d

3️⃣ Access Services:

	•	Nginx: http://localhost:8080
	•	Redis Insight: http://localhost:8001

   🌍 How it Works on Azure VM

✅ SSH into your Azure VM:

ssh azureuser@<your-vm-ip>

✅ Install Docker & Docker Compose (if not automated).

✅ Clone your repo and run:

docker-compose up -d

✅ Access Nginx and Redis UI using your VM public IP:

	•	http://<your-vm-ip>:8080 (Nginx)
	•	http://<your-vm-ip>:8001 (Redis Insight)

⸻

🪐 Future Enhancements
	•	Automate VM provisioning using Terraform.
	•	Auto-install Docker/Nginx using custom_data cloud-init script.
	•	Add a sample Node.js app to test Redis integration.
	•	Add monitoring with Grafana + Prometheus.

⸻

🤝 Contributions

Feel free to fork, modify, and contribute for learning and scaling this lab setup for Kubernetes, CI/CD pipelines, and advanced DevOps practices.

Happy Learning 


