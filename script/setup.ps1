# ==================================== Cert-Manager & Nginx-Ingress Script ===============================================

# Get EKS cluster credentials
echo "Getting EKS cluster credentials..."
aws eks update-kubeconfig --region us-east-1 --name CLUSTER-NAME

# Create namespaces
echo "Creating namespaces..."
kubectl create namespace cert-manager-tf
kubectl create namespace nginx-ingress-tf

# Add Helm repositories and update
echo "Adding Helm repositories and updating..."
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

# Install NGINX Ingress Controller
echo "Installing NGINX Ingress Controller..."
helm upgrade --install nginx-ingress ingress-nginx/ingress-nginx --version 4.5.0 --set controller.publishService.enabled=true --namespace nginx-ingress-tf

# Install Cert-Manager
echo "Installing Cert-Manager..."
helm install cert-manager jetstack/cert-manager --namespace cert-manager-tf --version v1.10.1 --set installCRDs=true

# Apply cluster issuer YAML
echo "Applying cluster issuer YAML..."
kubectl apply -f ./script/cluster-issuer.yml
