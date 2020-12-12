#!/usr/bin/env python3
import message_pb2
import argh
import uuid
import logging
import tornado.ioloop
import web

logging.basicConfig(level='INFO')

async def handle(request: web.Request) -> web.Response:
    message = message_pb2.Message()
    message.ParseFromString(request['body']) # type: ignore
    response = message_pb2.Message(
        id=str(uuid.uuid4()),
        sender='server',
        receiver=message.sender,
        content=f'thanks {message.sender} for your message: {message.content}',
    )
    return {'code': 200,
            'body': response.SerializeToString()}

def main(port=8080):
    routes = [('/(.*)', {'post': handle})]
    app = web.app(routes)
    print('start server on:', port)
    tornado.httpserver.HTTPServer(app).listen(8080)
    tornado.ioloop.IOLoop.current().start()

if __name__ == '__main__':
    argh.dispatch_command(main)
