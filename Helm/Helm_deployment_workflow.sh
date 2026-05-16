5 steps:

1) Load the chart and dependecies # example mariadb chart https://github.com/bitnami/charts/tree/main/bitnami/mariadb
2) Parse the values to YAML file
3) Generate the YAMLs   # templates are the yaml file
4) Parse YAMLs to kube object & validate 
5) send validates YAMLs to k8s 