# DEMO

### start k8s for OCL
script/
1. docker install
```
sudo sh install-docker.sh
```
2. k8s install
```
sudo sh install-k8s.sh
```
3. make kubectl config
```
sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
4. port open
master node
```
sh port-master.sh
```

worker nodes
```
sh port-worker.sh
```

5. kubeadm init for master node
```
sudo kubeadm init
....
sudo kubeadm join 10.0.14.1:6443 --token 6wv4tl.02cyaa568eo5zesc --discovery-token-ca-cert-hash sha256:082a3ca46cd0fdbc7b2347bf3782719a756484204ffcf585bcb075eb5c5c7438

# join command -> copy -> to worker nodes
```
6. kebeadm join for worker nodes
```
sudo kubeadm join 10.0.14.1:6443 --token 6wv4tl.02cyaa568eo5zesc --discovery-token-ca-cert-hash sha256:082a3ca46cd0fdbc7b2347bf3782719a756484204ffcf585bcb075eb5c5c7438

# forget join command

# Join token
kubeadm token list
# check sha256
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'


# if error for master node port
# in master node
sudo iptables -L | grep tcp
# check 6443, 2379:2380, 10250, 10257, 10259 port 
```
7. check master node ndoes
```
kubectl get no
# if you error
# Unable to connect to the server: x509: certificate signed by unknown authority (possibly because of "crypto/rsa: verification error" while trying to verify candidate authority certificate "kubernetes")
# retry -> 3
```

