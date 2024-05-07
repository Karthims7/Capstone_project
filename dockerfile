# Use the official Nginx image as the base image
FROM nginx:latest

# Copy the contents of the 'build' directory to the default Nginx web server directory
COPY build/. /usr/share/nginx/html

# Expose port 80 to allow external access
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]

