# Use Ollama’s base image with Python
FROM ollama/ollama:latest

# Set working directory
WORKDIR /app

# Copy your backend code
COPY . /app

# Install Python dependencies
RUN apt update && apt install -y python3-pip
RUN pip install fastapi uvicorn python-multipart fitz PyMuPDF requests pydantic

# Expose FastAPI port
EXPOSE 8000

# ✅ Start Ollama and FastAPI together using shell
CMD ["sh", "-c", "ollama serve & uvicorn main:app --host 0.0.0.0 --port 8000"]