set -e
ssh static_server "sudo mkdir -p -m 777 /assets"
scp -r $PWD/frontend/dist/* static_server:/assets/
scp -r $PWD/static_server/conf.d/nginx.conf static_server:/etc/nginx/nginx.conf
if [ $? = 0 ]; then
  echo "success for distributing files"
else
  echo "failed for distributing files"
  exit 1
fi
ssh static_server "sudo systemctl daemon-reload && sudo systemctl restart nginx.service"
if [ $? = 0 ]; then
  echo "success for restarting nginx process"
  exit 0
else
  echo "failed for restarting nginx process"
  exit 1
fi
