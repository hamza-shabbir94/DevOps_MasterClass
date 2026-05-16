# Helm Repo

# termonology
1) Charts
2) Repos # where you can store the helm charts
3) Release 


# Helm Repo Command
helm repo list
helm repo add <repo_name> <link> 
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add brigade https://brigadecore.github.io/charts
helm repo remove bitnami

# reason for adding the repo to search the chart in the repo
helm search repo mysql
helm search repo nginx
helm search repo database --version
# if we search for the chart in the helm artificate and hub have mutliple repo in it
helm search hub 
helm search hub nginx

# if we want to count the chart
helm search hub nginx | wc -l

# execute service using helm

helm install my-redis bitnami/redis --version 25.4.1

# to check the deployment done by helm
helm list
helm list --all-namespaces
helm list -A
# reuse the deployment naming then create it in another name space
helm install my-redis -n redis bitnami/redis --version 25.4.1

# status of deployment
helm status my-redis
helm status my-redis -n redis

# delete deployment
helm delete my-redis


# install mariadb database
kubectl get pods
helm install my-mariadb bitnami/mariadb --version 25.0.10
helm status my-mariadb # here command to find password and client for mariadb / kubectl get secret --namespace default my-mariadb -o jsonpath="{.data.mariadb-root-password}" | base64 -d

y2V8BsLOPd

# and when we want pass our value and secrets
vi mariadb_custom_value.yaml
helm install -n database --values /root/mariadb_custom_value.yaml my-mariadb bitnami/mariadb --version 25.0.10

# update

# repo
helm repo update
# here we can add/modify/remove the values in mariadb_custom_value.yaml file, whenever we upgrade revision will increase
helm upgrade -n database --values /root/mariadb_custom_value.yaml my-mariadb bitnami/mariadb --version 25.0.9

# helm uninstall
helm uninstall my-mariadb

# validate before running 
helm upgrade -n database --values /root/mariadb_custom_value.yaml my-mariadb bitnami/mariadb --version 25.0.9 --dry-run
 
# generate k8s deployable YAML using helm for this we do not need k8 running
helm template -n database --values /root/mariadb_custom_value.yaml my-mariadb bitnami/mariadb --version 25.0.9 a

# detail about deployment
helm get notes <deployment_name> -n <namespace>
helm get values <deployment_name> -n <namespace>
# values of revision 1, however this values will show you user define value
helm get values <deployment_name> -n <namespace> --revision 1

# for all the values we need check manifest
helm get manifest <deployment_name> -n <namespace>

# history of the revision
helm history <deployment_name> -n <namespace>

# rollback
helm rollback <deployment_name> 1

# keep the history, it will keep all the history
helm uninstall -n database <deployment_name> --keep-history

# wait for successfull installation
helm install my-mysql bitnami/mysql --version 9.4.4 --wait 
helm install my-mysql bitnami/mysql --version 9.4.4 --wait --timeout 20m
helm upgrade my-mysql bitnami/mysql --version 9.4.4 --wait --timeout 20m

# whenever you are upgrade is not come up successfully then helm will revert back to perviously successfull status
helm upgrade my-mysql bitnami/mysql --version 9.4.4 --atomic