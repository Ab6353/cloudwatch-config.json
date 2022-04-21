#!/bin/bash
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb -y
sudo apt-get update && sudo apt-get install collectd -y 
sudo systemctl start amazon-cloudwatch-agent.service && sudo systemctl enable amazon-cloudwatch-agent.service

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c ssm:AmazonCloudWatch-ashu11 -s
