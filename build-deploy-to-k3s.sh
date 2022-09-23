#!/bin/bash

docker-compose up -d --build

docker tag webcrm-admin-cp_app localhost:5100/webcrm-admin:latest

docker push localhost:5100/webcrm-admin:latest

kubectl delete -f kube/webcrm-admin-deployment.yaml
kubectl apply -f kube/webcrm-admin-deployment.yaml

kubectl get pods -A

pod=$(kubectl get pods | awk '{print $1}' | grep -e "webcrm")

kubectl describe pod ${pod}
