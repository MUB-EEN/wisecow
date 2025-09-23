from flask import Flask
import subprocess

app = Flask(__name__)

@app.route("/")
def wisecow():
    output = subprocess.getoutput("/app/wisecow.sh")
    return f"<pre>{output}</pre>"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)

