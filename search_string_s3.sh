#!/bin/bash
# Basic range in for loop
aws s3 ls s3://analytics-events-production-json-crush/year=2021/month=09/day=08/hour=23/  | awk -F ' ' '{print $4}' | while read line; do  
  echo $line
  date
  aws s3 cp s3://analytics-events-production-json-crush/year=2021/month=09/day=08/hour=23/$line - | grep 'email'
  #aws s3api  list-objects --bucket $line --output json --query "[sum(Contents[].Size), length(Contents[])]" | awk 'NR!=2 {print $0;next} NR==2 {print $0/1024/1024/1024" GB"}'
  #userFacingError_2021090823.json
  #masterError*.json
  #setUserAttributes_2021090823
  #setUserAttributesByServer_2021090823
done
date
echo All done
