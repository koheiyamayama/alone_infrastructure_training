echo "updating application server..."
ssh api1 "mkdir -p ~/app ~/env" &&
# ssh api2 "mkdir -p ~/app ~/env" &&
scp $PWD/app/* api1:~/app/ &&
# scp $PWD/app/* api2:~/app/ &&
scp $PWD/env/production_app_server.env api1:~/env/ &&
# scp $PWD/env/production_app_server.env api2:~/env/ &&

if [ $? = 0 ]; then
  printf "\e[32mcompleting the updating!! \e[m"
else
  printf "\e[31mupdate failed!! \e[m\n"
fi
echo -e "\n"

echo "restarting application server..."
ssh api1 "sudo systemctl daemon-reload && sudo systemctl restart app_server.service" &&
# ssh api2 "sudo systemctl daemon-reload && sudo systemctl restart app_server.service"
if [ $? = 0 ]; then
  printf "\e[32mcompleting the restarting!! \e[m\n"
else
  printf "\e[31mrestart failed!! \e[m\n"
fi
