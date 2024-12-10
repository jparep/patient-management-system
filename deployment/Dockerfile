# Use a lightweight Python base image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies required for Python packages
RUN apt-get update && apt-get install -y \
    libpq-dev gcc curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 - && \
    export PATH="$PATH:/root/.local/bin"

# Copy Poetry configuration files first for better build caching
COPY ../backend/pyproject.toml ../backend/poetry.lock ./

# Install production dependencies using Poetry
RUN poetry install --no-root --without dev

# Copy the Django backend code
COPY ../backend/ .

# Collect static files (for production)
RUN python manage.py collectstatic --noinput

# Expose the default Django port
EXPOSE 8000

# Start the application using Gunicorn
CMD ["poetry", "run", "gunicorn", "core.wsgi:application", "--bind", "0.0.0.0:8000"]
