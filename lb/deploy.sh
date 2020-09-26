echo "updating nginx configuration..."
scp ./lb/conf.d/production/nginx.conf pi@192.168.11.7:/etc/nginx/nginx.conf &&
scp ./lb/conf.d/production/main.conf pi@192.168.11.7:/etc/nginx/conf.d/main.conf
if [ $? = 0 ]; then
  printf "\e[32m completing the updating!! \e[m"
else
  printf "\e[31m update failed!! \e[m\n"
fi
echo -e "\n"
echo "restarting nginx process..."
ssh pi@192.168.11.7 "sudo systemctl restart nginx.service"
