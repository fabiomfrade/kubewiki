#!/bin/bash

# Function definitions

helpfunction() {
    echo ""
    echo "Usage: $0 -install -uninstall"
    echo -e "\t-install to deploy default objects in your cluster: Namespace, deploy, PV, PVC, CM, Load Balancer, SVC, Service Monitor and Monitoring Roles"
    echo -e "\t-uninstall to remove all itens previosly deployed"
    exit 1
}

funcadd() {
    echo "Deploying Kubewiki on your cluster"

    for i in $(ls -tv1 ./k8s/[0-9]*)
        do kubectl apply -f "$i"
    done

    sleep 2
    echo "Deploying Monitoring roles"
    kubectl apply -f ./k8s/monitoring/
    
    read -rp "Deploy Optional Features? (VPA and Ingress) [Y/N] " optional
    case "$optional" in
        [Yy] ) kubectl apply -f ./k8s/optional/;;
        # [Yy] ) kubectl apply -f ./k8s/deploy-vpa.yaml;;
        [Nn] ) echo "";;
        * ) echo "Just answer Y or N";;
    esac

    # read -rp "Install Ingress? [Y/N] " ingress
    # case "$ingress" in
    #     [Yy] ) kubectl apply -f ./k8s/ingress.yaml;;
    #     [Nn] ) echo "";;
    #     * ) echo "Just answer Y or N";;
    # esac
    exit
}

funcremove() {
    echo "Removing Kubewiki from your cluster"

    for i in $(ls -trv1 ./k8s/[0-9]*)
        do kubectl delete -f "$i"
    done

    # Removing monitoring permissions
    kubectl delete -f ./k8s/monitoring/

    # Checking if VPA are installed on cluster
    kubectl get vpa -n kubewiki | grep -i kube > /dev/null

    if [ $? -eq 0 ]
    then
        kubectl delete -f ./k8s/optional/deploy-vpa.yaml
    else
        echo "VPA not found"
    fi

    # Checking if Ingress are installed on cluster
    kubectl get ingress -n kubewiki | grep -i kube > /dev/null

    if [ $? -eq 0 ]
    then
        kubectl delete -f ./k8s/optional/ingress.yaml
    else
        echo "Ingress not found"
    fi
    exit
}

# Execution steps

case "$1" in
    --install ) funcadd ;;
    --uninstall ) funcremove ;;
    * ) helpfunction ;;
esac
