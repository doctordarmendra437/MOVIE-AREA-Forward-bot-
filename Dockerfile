# Use official lightweight Python image
FROM python:3.8-slim-buster

# Prevent interactive prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies you need (example: git, curl)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
 && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements first (better for Docker caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose port (if needed, for web services)
EXPOSE 8000

# Run your bot/app
CMD ["python", "main.py"]
