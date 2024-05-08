# Use the official Nginx image as the base image
FROM nginx:alpine

# Copy the contents of the 'build' directory to the default Nginx web server directory
COPY build/. /usr/share/nginx/html
