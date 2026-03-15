# step on master

cd
ssh-keygen -t rsa
ssh root@68.183.139.225 mkdir -p .ssh
pwd
cat /var/lib/jenkins/.ssh/id_rsa.pub | ssh root@68.183.139.225 'cat >> .ssh/authorized_keys'
ssh root@68.183.139.225
history


# step on slave
mkdir bin
pwd
cd bi
cd bin/
wget
wget http://64.23.144.52:8080/jnlpJars
wget http://64.23.144.52:8080/jnlpJars/slave.jar
java --version
history

java --version
apt install default-jre
# sudo add-apt-repository ppa:webupd8team/java