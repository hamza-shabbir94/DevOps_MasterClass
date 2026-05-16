helm create my-first-chart  # this chart by default using nginx
# we want to create a deployment from our chart
helm install my_custom_deployment /root/Chart/my-first-chart/

# what are the note ypou are getting after the deployment that you can see in the notes
# charts.yaml contains metadata

# it use GO language format
# templates container the resources file while going to deployed, and it will go through the value which we need to deploy or example like HPA

# helper file in templates, It create function

# values file 
# most variable are resolve by values file

# package your helm charts
helm package my-first-chart
helm package my-first-chart -u # -u download the latest dependencies then it will package

# how to validate the charts

helm lint my-first-chart # 3 thing it can return info,warning,error

# to update the dependency, first you need the add the dependencies in Charts.yaml, with application, we want to deploy the database mysql
helm dependency update my-first-chart