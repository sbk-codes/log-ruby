# Use the official Ruby image as the base
FROM ruby:2.7

# Set the working directory inside the container
WORKDIR /app

# Copy the application files into the container
COPY . /app

# Run the script when the container starts
CMD ["sh", "-c", "if [ -f $FILENAME ]; then ruby $FILENAME; else echo 'Invalid filename provided.'; fi"]
