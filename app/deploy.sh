echo "updating reverse proxy server..."

ssh api1 "sudo chmod o+w /etc/nginx/nginx.conf" &&
ssh api2 "sudo chmod o+w /etc/nginx/nginx.conf" &&
scp $PWD/app/reverse_proxy.conf.d/api1.conf api1:/etc/nginx/nginx.conf &&
scp $PWD/app/reverse_proxy.conf.d/api2.conf api2:/etc/nginx/nginx.conf &&
ssh api1 "sudo chmod o-w /etc/nginx/nginx.conf" &&
ssh api2 "sudo chmod o-w /etc/nginx/nginx.conf" &&

if [ $? = 0 ]; then
  printf "\e[32mcompleting the updating!! \e[m"
else
  printf "\e[31mupdate failed!! \e[m\n"
  exit $?
fi
echo -e "\n"

echo "restarting reverse proxy server..."
ssh api1 "sudo systemctl daemon-reload && sudo systemctl restart nginx.service" &&
ssh api2 "sudo systemctl daemon-reload && sudo systemctl restart nginx.service"

if [ $? = 0 ]; then
  printf "\e[32mcompleting the restarting!! \e[m\n"
else
  printf "\e[31mrestart failed!! \e[m\n"
  exit $?
fi

echo -e "\n"

echo "updating application server..."
ssh api1 "mkdir -p ~/app ~/env" &&
ssh api2 "mkdir -p ~/app ~/env" &&
scp -r $PWD/app/* api1:~/app/ &&
scp -r $PWD/app/* api2:~/app/ &&
scp $PWD/env/production_app_server.env api1:~/env/ &&
scp $PWD/env/production_app_server.env api2:~/env/ &&

if [ $? = 0 ]; then
  printf "\e[32mcompleting the updating!! \e[m"
else
  printf "\e[31mupdate failed!! \e[m\n"
  exit 1
fi
echo -e "\n"

echo "restarting application server..."
ssh api1 "sudo systemctl daemon-reload && sudo systemctl restart app_server.service" &&
ssh api2 "sudo systemctl daemon-reload && sudo systemctl restart app_server.service"
if [ $? = 0 ]; then
  printf "\e[32mcompleting the restarting!! \e[m\n"
else
  printf "\e[31mrestart failed!! \e[m\n"
  exit $?
fi
