from flask import Flask, json
import platform

app = Flask(__name__)

@app.route('/')
def get():
    result = {'service': 'ubuntu.python', 'python.version': platform.python_version()}
    return json.dumps(result)

if __name__== '__main__':
    app.run(debug=True,host='0.0.0.0')
