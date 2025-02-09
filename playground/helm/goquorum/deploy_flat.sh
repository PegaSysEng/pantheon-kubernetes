#!/usr/bin/env bash

set -e

helm upgrade goquorum-genesis --install --namespace goquorum-minikube --create-namespace \
  --values deploy_flat_values.yaml ../../../helm/charts/goquorum-genesis
helm dependency update ../../../helm/charts/goquorum-node
helm upgrade validator-1 --install --namespace goquorum-minikube ../../../helm/charts/goquorum-node
helm upgrade validator-2 --install --namespace goquorum-minikube ../../../helm/charts/goquorum-node
helm upgrade validator-3 --install --namespace goquorum-minikube ../../../helm/charts/goquorum-node
helm upgrade validator-4 --install --namespace goquorum-minikube ../../../helm/charts/goquorum-node
helm upgrade explorer    --install --namespace goquorum-minikube ../../../helm/charts/explorer
kubectl apply --namespace goquorum-minikube -f templates/ingress.yaml
