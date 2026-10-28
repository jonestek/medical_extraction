# Use an official lightweight Python image
FROM python:3.10-slim

# Set work directory
WORKDIR /app

# Keep Python from buffering stdout and stderr to assist in container logging
ENV PYTHONUNBUFFERED=1

# Install system dependencies if required
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application source code
COPY . .

# Command to run your application
CMD ["python", "main.py"]
