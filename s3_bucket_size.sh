#!/bin/bash
# Basic range in for loop
aws s3 ls s3:// | awk -F ' ' '{print $3}' | while read line; do  
  echo $line
  date
  aws s3api  list-objects --bucket $line --output json --query "[sum(Contents[].Size), length(Contents[])]" | awk 'NR!=2 {print $0;next} NR==2 {print $0/1024/1024/1024" GB"}'
done
date
echo All done