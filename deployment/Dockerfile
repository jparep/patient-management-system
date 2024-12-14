# Use a lightweight Python base image with a stable version tag
FROM python:3.11-slim-bullseye

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies required for Python packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev gcc curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Poetry (specify a stable version)
RUN curl -sSL https://install.python-poetry.org | python3 - && \
    chmod +x /root/.local/bin/poetry && \
    poetry self update 1.7.0

# Add Poetry to PATH globally
ENV PATH="/root/.local/bin:$PATH"

# Verify Poetry installation
RUN poetry --version

# Copy Poetry configuration files to leverage Docker layer caching
COPY backend/pyproject.toml backend/poetry.lock ./

# Install production dependencies using Poetry
RUN poetry install --no-root --only main

# Copy the backend application code into the container
COPY backend/ ./

# Set environment variables required by Django
ENV DJANGO_SETTINGS_MODULE=core.settings
ENV PYTHONUNBUFFERED=1
ENV DJANGO_STATIC_ROOT=/app/staticfiles

# Collect static files (for production)
RUN poetry run python manage.py collectstatic --noinput

# Expose the default Django port
EXPOSE 8000

# Start the application using Gunicorn
CMD ["poetry", "run", "gunicorn", "core.wsgi:application", "--bind", "0.0.0.0:8000"]
