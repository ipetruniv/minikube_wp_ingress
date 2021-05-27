## Kubernetes NGINX-Ingress + Wordpress + MySQL + Persistent Volumes

### Description

Install Wordpress, MySQL and expose using ingrtess controller
Adopted to run using minikube

- Author: Ihor Petruniv <ipetruniv@gmail.com>
- Version: 1.0.0

### Requirements:

- Minikube installed locally
- Install ingress addon:
```
minikube addons enable ingress
```
- Kubectl

## Reference

- https://hub.docker.com/_/mysql
- https://hub.docker.com/_/wordpress

### Installation:


Create Resources (Services, Ingress, Deployments ...):

```
kubectl apply -f secrets.yaml
kubectl apply -f db-tier-deployment.yaml
kubectl apply -f app-tier-deployment.yaml
kubectl apply -f nginx-ingress.yaml
```

Create local host for minikube.io domain (or edit it)
First get ingress IP:
```
kubectl get ingress
```

- Adds minikube.io to /etc/hosts file with IP address from previous output
- Example: 192.168.99.100  minikube.io


Access https://minikube.io

MySQL
Host: mysql
User worpress
Password: Demo12345!


To delete all resources:

```
kubectl delete svc,pv,pvc,deployments,pods,secrets,ingress -l app=wpdemo
```

