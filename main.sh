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


# Start/enable services
systemctl stop postfix
systemctl disable postfix
cd /ansible-controller
ansible-playbook create_all.yaml


export IMAGE_GALLERY_SCRIPT_VERSION="1.1"
CONFIG_BUCKET="au.zt.image-gallery-config"

# Install packages
yum -y update
amazon-linux-extras install -y nginx1
sudo yum install -y postgresql
sudo yum install -y gcc
sudo yum install -y python3-devel
sudo yum install -y postgresql-devel
sudo yum install -y jq # json parser
sudo pip3 install psycopg2
sudo pip3 install boto3
cd /home/ec2-user




pip3 install --user boto3
pip3 install --user psycocd anpg2
# Configure/install custom software
cd /home/ec2-user
git clone https://github.com/contour66/python-image-gallery.git
chown -R ec2-user:ec2-user python-image-gallery
su ec2-user -l -c "cd ~/python-image-gallery && pip3 install -r requirements.txt --user"

aws s3 cp s3://${CONFIG_BUCKET}/nginx/nginx.conf /etc/nginx
aws s3 cp s3://${CONFIG_BUCKET}/nginx/default.d/image_gallery.conf /etc/nginx/default.d
aws s3 cp s3://${CONFIG_BUCKET}/nginx/index.html /usr/share/nginx/html
chown nginx:nginx /usr/share/nginx/html/index.html

# Start/enable services
systemctl stop postfix
systemctl disable postfix
systemctl start nginx
systemctl enable nginx

su ec2-user -l -c "cd ~/python-image-gallery && ./start" >/var/log/image_gallery.log 2>&1 &

