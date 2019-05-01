#!/usr/bin/env bash
if command -v kubectl &>/dev/null; then
    currentContext=$(kubectl config current-context)
    if [ "${currentContext}" != "default" ] && [ "${currentContext}" != "minikube" ]; then
        echo " ${currentContext} "
    fi
fi
