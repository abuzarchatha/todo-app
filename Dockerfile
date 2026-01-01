# 1️⃣ Base image – python 3.11 slim (size kam)
FROM python:3.11-slim

# 2️⃣ Working directory inside container
WORKDIR /app

# 3️⃣ System dependencies (optional, lekin gcc/libpq-dev PostgreSQL ke liye)
#    Agar aap later PostgreSQL use nahi kar rahe to ye step skip ho sakta hai.
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# 4️⃣ Copy only requirements first (layer caching ka fayda)
COPY requirements.txt .

# 5️⃣ Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 6️⃣ Copy source code (app.py) aur koi extra folder (agar ho)
COPY . .

# 7️⃣ Expose Flask default port
EXPOSE 5000

# 8️⃣ Run command (Flask app)
CMD ["python", "app.py"]

