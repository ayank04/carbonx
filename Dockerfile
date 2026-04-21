FROM python:3.10-slim

# Set the working directory to the specific subfolder so that uvicorn finds app.py
WORKDIR /app/Backend/SecureCarbonX/ai-service

# Install system dependencies required by OpenCV (cv2)
RUN apt-get update && apt-get install -y libgl1 libglib2.0-0 libsm6 libxext6 libxrender1 libxcb-shape0 libxcb-xfixes0 libxcb1 && rm -rf /var/lib/apt/lists/*

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
