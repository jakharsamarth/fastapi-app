# Use Ubuntu as the base image
FROM ubuntu:latest

# Install Python, pip, and venv
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv

# Set the working directory
WORKDIR /app

# Copy project files to the container
COPY . /app

# Create a virtual environment
RUN python3 -m venv /app/venv

# Upgrade pip inside the virtual environment
RUN /app/venv/bin/python -m pip install --upgrade pip

# Install dependencies from requirements.txt
RUN /app/venv/bin/python -m pip install -r requirements.txt

# Expose the application on port 8000
EXPOSE 8000

# Run FastAPI using Uvicorn
CMD ["/app/venv/bin/python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
