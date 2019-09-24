#!/bin/bash


current=$1

 
let page=1

result=$(hub api ${current}/repos\?page=${page})

if [[ $? != 0 ]]; then 
   exit 1
fi

let count=$(echo $result | jq -r 'length')


while [[ $count -gt 0 ]];
do
  echo $result | jq -r '.[].full_name'
  page=$(($page + 1 ))

  result=$(hub api ${current}/repos\?page=${page})

  if [[ $? != 0 ]]; then 
    exit 1
  fi

  count=$(echo $result | jq -r 'length')
done
