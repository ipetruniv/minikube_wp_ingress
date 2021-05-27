!#/bin/bash
minikube addons enable ingress
#Add sercrets
kubectl apply -f secrets.yaml
#Spinup MYSQL
kubectl apply -f db-tier-deployment.yaml
#Start WP pod
kubectl apply -f app-tier-deployment.yaml
#Enable ingress
kubectl apply -f nginx-ingress.yaml
ingressip=`kubectl get ingress | grep -v NAME | awk '{print $4}'`
while [ -z "{$ingressip}" ]
do
	ingressip=`kubectl get ingress | grep -v NAME | awk '{print $4}'`
done
echo "Ingress IP is: $ingressip"
sudo echo "$ingressip minikube.io" >> /etc/hosts
curl http://minikube.io
echo "Site is available http://minikube.io"

