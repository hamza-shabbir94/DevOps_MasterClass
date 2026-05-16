#!/bin/bash
apt update
apt install apache2 -y
systemctl start apache2
systemctl enable apache2
echo "Hello World from $(hostname -f)" > /var/www/html/index.html