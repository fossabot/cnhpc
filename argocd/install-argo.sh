#!/usr/bin/env bash

# https://argoproj.github.io/argo-cd/
# kubectl create namespace argocd
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
#
# On GKE, you will need grant your account the ability to create new cluster roles:
# kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user="$(gcloud config get-value account)"

kubectl create namespace argocd
kubectl apply -n argocd -f install.yaml

# Kubectl port-forwarding can also be used to connect to the API server without exposing the service.
# kubectl port-forward svc/argocd-server -n argocd 8080:443

# install the argocd cli
# check what the latest version is
# VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
# visit the argocd release page: https://github.com/argoproj/argo-cd/releases and download the executable for your platform
# or for linux download with curl
# curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64
# chmod +x /usr/local/bin/argocd

# The initial password is autogenerated to be the pod name of the Argo CD API server. This can be retrieved with the command:
# kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
# argocd login <ARGOCD_SERVER>           <-- login
# argocd account update-password         <-- change password