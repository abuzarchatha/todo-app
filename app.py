# app.py
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def hello():
    return jsonify(message="Hello, DevOps world! This is Todo‑App API."), 200

if __name__ == '__main__':
    # 0.0.0.0 makes it reachable from Docker/container
    app.run(host='0.0.0.0', port=5000, debug=True)

