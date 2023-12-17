#!/bin/bash

if [[ ${KUBECONFIG} == "" ]]
then
    echo "Please export KUBECONFIG env variable before running script!!!"
    exit 1
else
    echo "Current value of KUBECONFIG --> [${KUBECONFIG}]"
fi

export $(xargs <.env)

cd "01-init"
helm dependency update
helm upgrade -i init . -f values-${ENV}.yaml -n argocd --create-namespace
cd ..
