IP_LIST=(2 3 5 7 8 9 10 11)
for ip in ${IP_LIST[@]}; do
  ping -c 3 "192.168.11.$ip"
  if [ $? != 0 ]; then
    printf "\e[31m fail ping to 192.168.11.$ip! \e[m"
  fi
  printf "\e[32m success ping to 192.168.11.$ip! \e[m"
  echo -e "\n\n"
done
