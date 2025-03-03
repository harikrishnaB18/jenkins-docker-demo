# Use an official Nginx image as the base
FROM nginx:latest  

# Copy your website files to the container
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80