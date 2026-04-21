FROM python:3.10-slim

# Set the working directory to the specific subfolder so that uvicorn finds app.py
WORKDIR /app/Backend/SecureCarbonX/ai-service

# Copy the requirements file specifically
COPY Backend/SecureCarbonX/ai-service/requirements.txt .

# Install dependencies.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the AI service files
COPY Backend/SecureCarbonX/ai-service/ .

# Ensure port environment variable is expected
ENV PORT=8000

# Expose the port (Railway overrides this with $PORT but it's good practice)
EXPOSE $PORT

# Start the FastAPI server using Uvicorn
CMD uvicorn app:app --host 0.0.0.0 --port $PORT
