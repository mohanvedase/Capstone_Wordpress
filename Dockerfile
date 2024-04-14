# Use the official WordPress image
FROM wordpress:latest

# Set the working directory within the container
WORKDIR /var/www/html

# Copy all files from the local directory (replace with your actual path)
COPY ./wp-content/ ./wp-content/

# Set appropriate permissions (optional, adjust based on your needs)
RUN chown -R www-data:www-data .

# Expose the default WordPress port
EXPOSE 80
