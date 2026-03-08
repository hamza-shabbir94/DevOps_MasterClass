1Passworda
java -version
sudo apt-get install openjdk-11-jdk


# Jenkins Architecture
#Jenkins follow the master slave Architecture
#Master Node = Work Like a Controller
#Worker Node = Slave/Worker node will work as a Execution Node 
#single Master node can have Multiple Worker Node 
#Master Controls the Load Distribution on Slave Nodes
#
#
#Master Node -
#    Schedule Build Job
#    Dispatch Build Execution to slave NodeMonitor Slave and Record the build result
#    Monitor slave and record the build result
#
#Slave Node -
#    Execute Build Dispatch by Master
#
#
# Job


vi testscript.sh >>EOF
#!/bin/bash
#
Name=$1
Age=$3
LastName=$2
Visible=$4
if [ "$Visible" = "true" ]; then
    echo "I am $Name $LastName, and I am $Age old."
else
    echo "Please pass Visible True!!!"
fi
EOF
chmod +x testscript.sh