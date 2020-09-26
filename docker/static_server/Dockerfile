FROM nginx:1.14-alpine
COPY static_server/conf/nginx.conf /etc/nginx/nginx.conf
RUN mkdir /assets
COPY frontend/dist /assets/
