from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.get("/")
def hello():
    return jsonify(message="Hello from Dockerized Flask!")

@app.get("/healthz")
def health():
    return jsonify(status="ok")

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port, debug=False)