#!/usr/bin/bash
sudo yum update -y
sudo yum install -y gcc
sudo yum install -y python3
sudo pip3 install libpq-dev python3-dev
sudo yum install -y python3-devel
sudo yum install -y postgresql-devel
sudo pip3 install boto3 #--user
sudo pip3 install boto #--user
sudo pip3 install botocore #--user
sudo pip3 install postgresql
sudo pip3 install ansible #--user
sudo pip3 install psycopg2 #--user
sudo yum install -y git
sudo yum install -y jq #
sudo pip3 install  --user psycopg2
cd /home/ec2-user
# Start/enable services
systemctl stop postfix
systemctl disable postfix


# Configure/install custom software
cd /home/ec2-user
git clone https://github.com/contour66/python-image-gallery.git
git clone https://github.com/contour66/ansible-controller.git
chown -R ec2-user:ec2-user python-image-gallery
chown -R ec2-user:ec2-user ansible-controller
su ec2-user -c "cd ~/ansible-controller && pip3 install -r requirements.txt --user"
su ec2-user -c "cd ~/python-image-gallery && pip3 install -r requirements.txt --user"
cd ansible-controller
ansible-playbook create_all.yaml

# Start/enable services
systemctl stop postfix
systemctl disable postfix
