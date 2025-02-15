# Use the official Python image from the Docker Hub
FROM python:3.12-slim-bookworm

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates

# Add the UV installer script
ADD https://astral.sh/uv/install.sh /uv-installer.sh

# Run the installer
RUN sh /uv-installer.sh && rm /uv-installer.sh

# Set the PATH environment variable
ENV PATH="/root/.local/bin/:$PATH"

# Set the working directory
WORKDIR /app

# Copy the application code
COPY app.py /app  

# Command to run the application (if applicable)
CMD [ "uv","run","app.py" ]