FROM nginx:1.14-alpine
RUN addgroup www-data -S
RUN adduser www-data -S -G www-data
COPY ./lb/conf.d/development/nginx.conf /etc/nginx/nginx.conf
CMD [ "nginx", "-c", "/etc/nginx/nginx.conf" ]
