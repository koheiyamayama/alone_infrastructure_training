IP_LIST=(2 3 5 7 8 9 10)
for ip in ${IP_LIST[@]}; do
  ssh pi@192.168.11.$ip "sudo shutdown -h now"
  if [ $? != 0 ]; then
    printf "\e[31m fail! \e[m"
  else
    printf "\e[32m success! \e[m"
  fi
  echo -e "\n\n"
done

ssh ubuntu@192.168.11.4 "sudo shutdown -h now"

echo "all shutdown"
