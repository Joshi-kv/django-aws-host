FROM python:3.10-slim AS builder

# Set workdir
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose port
EXPOSE 8000

# Start using Gunicorn (better for prod)
CMD ["gunicorn", "djangoawshost.wsgi:application", "--bind", "0.0.0.0:8000"]
