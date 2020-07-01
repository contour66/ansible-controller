#!/usr/bin/bash

sudo yum install -y postgresql
sudo yum install -y gcc
sudo yum install -y python3-devel
sudo yum install -y postgresql-devel
sudo yum install -y jq # json parser
sudo yum install -y git
sudo pip3 install psycopg2
sudo pip3 install boto3
cd /home/ec2-user
pip3 install --user boto3
pip3 install --user psycopg2