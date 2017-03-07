#!/bin/bash

/usr/local/bin/kubectl config set-cluster cluster --insecure-skip-tls-verify=true --server=$KUBE_URL
/usr/local/bin/kubectl config set-credentials cluster-admin --username=$KUBE_LOGIN --password=$KUBE_PASSWORD
/usr/local/bin/kubectl config set-context kpm --user=cluster-admin --cluster=cluster
/usr/local/bin/kubectl config use-context kpm
/usr/local/bin/kubectl version

/usr/bin/helm "$@"
