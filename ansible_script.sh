
#!/usr/bin/bash
yum update -y
yum install -y gcc
yum install -y python3
sudo pip3 install libpq-dev python3-dev
yum install -y python3-devel
yum install -y postgresql-devel
pip3 install boto3 #--user
pip3 install boto #--user
pip3 install ansible #--user
pip3 install psycopg2 #--user
yum install -y git
cd /home/ec2-user
git clone https://github.com/contour66/python-image-gallery.git
chown -R ec2-user:ec2-user python-image-gallery