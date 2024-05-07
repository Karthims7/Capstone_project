#!/bin/bash

DOCKERFILE="dockerfile"

# Check if Dockerfile already exists
if [ -f "$DOCKERFILE" ]; then
    echo "Dockerfile already exists. Skipping creation."
else
    # Define Dockerfile content
    DOCKERFILE_CONTENT=$(cat <<EOF
# Use the official Nginx image as the base image
FROM nginx:latest

# Copy the contents of the 'build' directory to the default Nginx web server directory
COPY build/. /usr/share/nginx/html

# Expose port 80 to allow external access
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
EOF
    )

    # Write Dockerfile content to a file
    echo "$DOCKERFILE_CONTENT" > "$DOCKERFILE"
    echo "Dockerfile created."
fi

# Build Docker image
docker build -t my-html-app .

