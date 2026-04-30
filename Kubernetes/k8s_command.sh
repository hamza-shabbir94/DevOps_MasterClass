kubeadm token create --print-join-command
kubeadm token list

# node Draining
# first we need to disable deamon set
kubectl drain node_name --ignore-deamonset
kubectl drain node_name 

# Uncordon node
kubectl uncordon node_name


# common command

# configmap
kubectl create configmap name --from-file /path 
kubectl get configmap name


# secret
kubectl create secret generic db-user-pass --from-file=/location
kubectl get secret
kubectl describe seccret

# mount volume
