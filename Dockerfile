# A minimal Nginx container
FROM nginx:latest

# Add some stuff via apt-get
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        less \
        vim \
    && rm -rf /var/lib/apt/lists/*

# Add this webapp to the container
COPY index.html /usr/share/nginx/html/
COPY css /usr/share/nginx/html/css
COPY fonts /usr/share/nginx/html/fonts
COPY images /usr/share/nginx/html/images
COPY js /usr/share/nginx/html/js

# Add the Nginx conf
COPY etc /etc

# Nginx start command
CMD [ "nginx", \
        "-g", \
        "daemon off;"]