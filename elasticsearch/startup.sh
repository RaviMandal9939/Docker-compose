#!/bin/sh
#elasticsearch
su - elasticsearch -c /usr/share/elasticsearch/bin/elasticsearch > /dev/null 2>&1 
watch netstat -tulpn
