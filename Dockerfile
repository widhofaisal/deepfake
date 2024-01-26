# 1. Use a lightweight base image with Python 3.10 pre-installed
FROM python:3.10.12-bullseye

# 2. Set the working directory
WORKDIR /app

# 3. Copy application code
COPY . /app

# 4. Install dependencies using pip
RUN python3 -m pip install --upgrade pip
RUN apt-get update && apt-get install -y python3-pip libgl1-mesa-glx
RUN pip install -r requirements.txt

# Define environment variable
ENV FLASK_APP=main
ENV FLASK_ENV=production

# 5. Define the command to be executed when the container starts
CMD ["python", "server.py"]  # RUN IN DEVELOPMENT
# CMD ["gunicorn", "main:app", "-b", "0.0.0.0:5000"]
# CMD ["gunicorn", "main:app", "-b", "0.0.0.0:5000", "--timeout", "86400", "--capture-output", "--access-logfile", "/var/log/gunicorn/access.log", "--error-logfile", "/var/log/gunicorn/error.log"]

