#!/bin/bash

# Function definitions

helpfunction() {
    echo ""
    echo "Usage: $0 -install -uninstall -vpa -ingress"
    echo -e "\t-install to install default objects in your cluster: deploy, PV, PVC, CM and SVC"
    echo -e "\t-uninstall to uninstall all itens previosly installed"
    exit 1
}

funcadd() {
    echo "Installing Kubewiki on your cluster"

    for i in $(ls -tv1 ./k8s/[0-9]*)
        do kubectl apply -f "$i"
    done
    
    read -rp "Install VPA? [Y/N] " vpa
    case "$vpa" in
        [Yy] ) kubectl apply -f ./k8s/deploy-vpa.yaml;;
        # [Yy] ) echo "Installing VPA";;
        [Nn] ) echo "";;
        * ) echo "Just answer Y or N";;
    esac

    read -rp "Install Ingress? [Y/N] " ingress
    case "$ingress" in
        [Yy] ) kubectl apply -f ./k8s/ingress.yaml;;
        # [Yy] ) echo "Installing Ingress";;
        [Nn] ) echo "";;
        * ) echo "Just answer Y or N";;
    esac
    exit
}

funcremove() {
    echo "Uninstalling Kubewiki from your cluster"

    for i in $(ls -trv1 ./k8s/[0-9]*)
        do kubectl delete -f "$i"
    done

    # Checking if VPA are installed on cluster
    kubectl get vpa -n kubewiki | grep -i kube > /dev/null

    if [ $? -eq 0 ]
    then
        kubectl delete -f ./k8s/deploy-vpa.yaml
    else
        echo "VPA not found"
    fi

    # Checking if Ingress are installed on cluster
    kubectl get ingress -n kubewiki | grep -i kube > /dev/null

    if [ $? -eq 0 ]
    then
        kubectl delete -f ./k8s/ingress.yaml
    else
        echo "Ingress not found"
    fi
    exit
}

# Execution steps

case "$1" in
    --install ) funcadd ;;
    --uninstall ) funcremove ;;
    --vpa ) funcvpa ;;
    --ingress ) funcingress ;;
    * ) helpfunction ;;
esac
