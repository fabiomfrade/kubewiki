![kuberntes](https://img.shields.io/badge/kubernetes-326ce5.svg?&style=for-the-badge&logo=kubernetes&logoColor=white) ![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white) ![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)
# Projeto Kubewiki

Este projeto implementa a aplicação DokuWiki no Kubernetes, utilizando Nginx como servidor web. A configuração é feita para garantir que a aplicação seja acessível externamente e que os recursos sejam alocados e ajustados conforme necessário.

## Componentes

O projeto consiste nos seguintes componentes principais:

- **Nginx Pod**: Roda a aplicação Nginx que serve a DokuWiki.
- **ConfigMap**: Armazena a configuração do Nginx.
- **Persistent Volume (PV)** e **Persistent Volume Claim (PVC)**: Armazenam os dados da DokuWiki.
- **Service**: Permite o acesso à aplicação dentro do cluster.
- **Ingress**: Permite o acesso externo à aplicação.
- **Vertical Pod Autoscaler (VPA)**: Ajusta automaticamente os recursos alocados para a aplicação.

## Pré-requisitos

- Kubernetes cluster
- kubectl configurado para se comunicar com o seu cluster

## Visão do Projeto

---
![kuberntes](https://img.shields.io/badge/kubernetes-326ce5.svg?&style=for-the-badge&logo=kubernetes&logoColor=white) ![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white) ![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)
# Kubewiki Project

This project implements the DokuWiki application on Kubernetes, using Nginx as the web server. The setup is designed to ensure that the application is accessible externally and that resources are allocated and adjusted as needed.

## Components

The project consists of the following main components:

- **Nginx Pod**: Runs the Nginx application that serves DokuWiki.
- **ConfigMap**: Stores the Nginx configuration.
- **Persistent Volume (PV)** and **Persistent Volume Claim (PVC)**: Store the DokuWiki data.
- **Service**: Allows access to the application within the cluster.
- **Ingress**: Enables external access to the application.
- **Vertical Pod Autoscaler (VPA)**: Automatically adjusts the resources allocated to the application.

## Prerequisites

- Kubernetes cluster
- kubectl configured to communicate with your cluster

## Project Overview

