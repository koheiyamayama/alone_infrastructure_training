echo "updating application server..."
ssh api1 "mkdir -p ~/app" &&
ssh api2 "mkdir -p ~/app" &&
scp $PWD/app/* api1:~/app/ &&
scp $PWD/app/* api2:~/app/


if [ $? = 0 ]; then
  printf "\e[32m completing the updating!! \e[m"
else
  printf "\e[31m update failed!! \e[m\n"
fi
echo -e "\n"

echo "restarting application server..."
ssh api1 "cd ~/app && sudo systemctl restart app_server.service" &&
ssh api2 "cd ~/app && sudo systemctl restart app_server.service"
printf "\e[32m completing the restarting!! \e[m"
echo -e "\n"
