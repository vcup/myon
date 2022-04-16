FROM node:latest as build-stage
WORKDIR /app
COPY ./ .
RUN npm install
RUN npm run build

FROM nginx as production-stage
RUN mkdir /app
COPY --from=build-stage /app/dist /app
RUN echo "user  nginx;\
worker_processes  1;\
error_log  /var/log/nginx/error.log warn;\
pid        /var/run/nginx.pid;\
events {\
  worker_connections  1024;\
}\
http {\
  include       /etc/nginx/mime.types;\
  default_type  application/octet-stream;\
  log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '\
                    '$status $body_bytes_sent "$http_referer" '\
                    '"$http_user_agent" "$http_x_forwarded_for"';\
  access_log  /var/log/nginx/access.log  main;\
  sendfile        on;\
  keepalive_timeout  65;\
  server {\
    listen       80;\
    server_name  localhost;\
    location / {\
      root   /app;\
      index  index.html;\
      try_files $uri $uri/ /index.html;\
    }\
    error_page   500 502 503 504  /50x.html;\
    location = /50x.html {\
      root   /usr/share/nginx/html;\
    }\
  }\
}" > /etc/nginx/nginx.conf