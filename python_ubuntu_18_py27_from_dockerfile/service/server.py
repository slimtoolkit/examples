from flask import Flask, json
import platform

app = Flask(__name__)

@app.route('/')
def get():
    result = {'status': 'success', 'message': 'Hello World!', 'framework': 'flask', 'stack': 'python'}
    return json.dumps(result)

if __name__== '__main__':
    app.run(debug=True,host='0.0.0.0',port=1300)
