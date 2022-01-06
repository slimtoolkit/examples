from flask import Flask
import flask
from flask_restful import Resource, Api
import platform
import os

class ApiRoot(Resource):
    def get(self):
      return {'status': 'success', \
              'message': 'Hello World!', \
              'framework': 'flask', \
              'frameworkversion': flask.__version__, \
              'stack': 'python', \
              'stackversion': platform.python_version(), \
              'packagemanager': 'pip', \
              'baseimageversion': 'Ubuntu 18.04'}

if __name__ == "__main__":
  try:
    app = Flask(__name__)
    api = Api(app)
    app.config['DEBUG'] = True
    api.add_resource(ApiRoot, '/')

    app.run(host='0.0.0.0',port=1300,threaded=True,use_reloader=False)
  except KeyboardInterrupt:
    pass
