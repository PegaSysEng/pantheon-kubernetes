#!/usr/bin/env bash

set -e

rm -rf charts/goquorum-genesis
rm -rf charts/goquorum-node
rm -rf charts/blockscout

mkdir -p charts
cp -r ../../../helm/charts/goquorum-genesis charts/.
cp -r ../../../helm/charts/goquorum-node charts/.
cp -r ../../../helm/charts/explorer charts/.

helm dependency update

helm upgrade goquorum-minikube --install --create-namespace --namespace goquorum-minikube .
