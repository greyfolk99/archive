FROM nginx:latest
RUN apt update
RUN apt install sudo
RUN sudo apt install certbot python3-certbot-nginx -y
RUN rm /etc/nginx/conf.d/default.conf
# TODO - Make nginx.conf and overwrite it
RUN sed -i '$s/}/include \/etc\/nginx\/sites-enabled\/*;\n}/' /etc/nginx/nginx.conf
RUN sudo service nginx restart