🚀 Order Service – GKE Deployment (v7)

Este proyecto implementa un microservicio de órdenes usando Node.js y lo despliega en Google Kubernetes Engine (GKE) mediante Terraform.

La imagen utilizada es:

🔗 Docker Hub:
https://hub.docker.com/repository/docker/jensanchez/orderservice/general

📌 Versión usada: jensanchez/orderservice:v7

📦 Contenido del repositorio
/
├── Dockerfile
├── orderservice.js
├── k8s/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── docker-compose.yml
└── README.md

🧰 Requisitos previos

Antes de iniciar, debes tener instalado:

Google Cloud CLI (gcloud)
https://cloud.google.com/sdk/docs/install

Terraform >= 1.0
https://developer.hashicorp.com/terraform/downloads

Kubectl
https://kubernetes.io/docs/tasks/tools/

Una cuenta de GCP con permisos para:

Crear GKE clusters

Crear balanceadores de carga

Asignar IPs estáticas

🔑 1. Autenticarse en Google Cloud
gcloud auth login
gcloud auth application-default login


Seleccionar proyecto:

gcloud config set project <PROJECT_ID>

🗂️ 2. Crear el archivo terraform.tfvars

Ejemplo:

project_id       = "my-gcp-project"
credentials_file = "gcp-key.json"
region           = "us-central1"
zone             = "us-central1-a"

cluster_name = "orders-cluster"
node_count   = 2

image    = "jensanchez/orderservice:v7"
replicas = 2

🔨 3. Inicializar Terraform
terraform init

📋 4. Revisar cambios
terraform plan

🚀 5. Desplegar en GKE
terraform apply -auto-approve


Esto crea:

Un clúster GKE

Un LoadBalancer con IP estática

Deployment con réplicas

Namespace orders

Service orderservice-lb

🔌 6. Conectarse al clúster
gcloud container clusters get-credentials orders-cluster --zone us-central1-a --project <PROJECT_ID>


Verifica:

kubectl get nodes
kubectl get pods -n orders
kubectl get svc -n orders

🌐 7. Probar el servicio

Encuentra la IP del LoadBalancer:

kubectl get svc -n orders orderservice-lb


Salida típica:

EXTERNAL-IP: cambielaip

🔥 Health check:
curl http://cambielaip/health

🔥 Endpoint funcional:
curl http://cambielaip/orders/123/status

🛑 8. Destruir la infraestructura
terraform destroy -auto-approve

📌 Notas importantes

✔ La imagen usada es la versión v7, que incluye:

Variables de entorno requeridas

DEMO_MODE habilitado

Correcciones al endpoint /orders/:id/status

✔ El despliegue usa LoadBalancer para exponer el servicio en Internet.
✔ La escalabilidad horizontal se controla desde Terraform vía replicas.
✔ Los nodos del clúster pueden aumentarse modificando node_count.
