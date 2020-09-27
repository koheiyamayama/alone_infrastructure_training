FROM nginx:1.14-alpine
RUN addgroup www-data -S
RUN adduser www-data -S -G www-data
COPY ./static_server/conf.d/nginx.conf /etc/nginx/nginx.conf
RUN mkdir /assets
COPY frontend/dist /assets/
