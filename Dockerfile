FROM nginx:alpine
COPY index.html /usr/share/nginx/html/
RUN echo 'server { listen 80; location / { root /usr/share/nginx/html; try_files $uri /index.html; add_header Strict-Transport-Security "max-age=31536000; preload" always; } }' > /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]