#!/bin/bash

echo "[TASK 1] Pull required containers"
kubeadm config images pull #>/dev/null 2>&1

echo "[TASK 2] Initialize Kubernetes Cluster"
# kubeadm init --apiserver-advertise-address=172.16.16.100 --pod-network-cidr=192.169.0.0/16 >> /root/kubeinit.log 2>/dev/null
kubeadm init --apiserver-advertise-address=192.168.88.160 --pod-network-cidr=10.244.0.0/16  >> /root/kubeinit.log #2>/dev/null

echo "[TASK 3] Deploy Calico network"
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://docs.projectcalico.org/v3.23/manifests/calico.yaml #>/dev/null 2>&1

echo "[TASK 4] Generate and save cluster join command to /joincluster.sh"
kubeadm token create --print-join-command > /joincluster.sh #2>/dev/null

echo "[TASK 5] Copy kubeconfig"
cp /etc/kubernetes/admin.conf /root/.kube/config