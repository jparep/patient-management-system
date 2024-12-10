# Use a lightweight Python base image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies required for Python packages
RUN apt-get update && apt-get install -y \
    libpq-dev gcc curl && \
    apt-get clean

# Install Python package manager
RUN python -m pip install --upgrade pip

# Copy only the requirements files first for better build caching
COPY ../backend/requirements/ /requirements/

# Install production dependencies
RUN pip install --no-cache-dir -r /requirements/prod.txt

# Copy the Django backend code
COPY ../backend/ .

# Collect static files (for production)
RUN python manage.py collectstatic --noinput

# Expose the default Django port
EXPOSE 8000

# Start the application using Gunicorn
CMD ["gunicorn", "core.wsgi:application", "--bind", "0.0.0.0:8000"]
