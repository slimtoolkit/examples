from flask import Flask, json
import flask
import platform


app = Flask(__name__)

@app.route('/')
def get():
    result = {'status': 'success', 'message': 'Hello World!', 'framework': 'flask', 'frameworkversion': flask.__version__,'stack': 'python', 'stackversion': platform.python_version(), 'packagemanager': 'pip', 'baseimageversion': 'Ubuntu 18.04'}
    return json.dumps(result)

if __name__== '__main__':
    app.run(debug=True,host='0.0.0.0',port=1300)
