#!/usr/bin/env python3
import message_pb2
import uuid
import argh
import requests

def main(sender=None, receiver=None, content=None, addr: 'server address' = None): # type: ignore
    assert sender, '--sender is required'
    assert receiver, '--receiver is required'
    assert content, '--content is required'
    assert addr, '--addr is required'
    message = message_pb2.Message(
        id=str(uuid.uuid4()),
        sender=sender,
        receiver=receiver,
        content=content,
    )
    resp = requests.post(addr, data=message.SerializeToString())
    assert resp.status_code == 200, [resp.status_code, resp.text]
    resp_message = message_pb2.Message()
    resp_message.ParseFromString(resp.content) # type: ignore
    print(resp_message)

if __name__ == '__main__':
    argh.dispatch_command(main)
