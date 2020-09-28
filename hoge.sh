#!/bin/bash
COUNT=0
while [ $COUNT != 30 ] 
do
  echo $COUNT
  COUNT=$(($COUNT+1))
  sleep 1
done
