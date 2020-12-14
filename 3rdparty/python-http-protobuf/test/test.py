#!/usr/bin/env python3
import contextlib
import pytest
import shell as sh
import pool.proc
import requests
import time

def test_basic():
    with server() as addr:
        resp = sh.run(
            'python src/cli.py',
            '--sender bob',
            '--receiver jane',
            '--content "nice to meet you!"',
            '--addr', addr,
        )
        content = [line for line in resp.splitlines() if 'content:' in line][0]
        assert content == 'content: "thanks bob for your message: nice to meet you!"'

@contextlib.contextmanager
def server():
    port = 8080
    proc = pool.proc.new(sh.run, 'python src/server.py --port', port)
    addr = f'http://localhost:{port}'
    try:
        for _ in range(100):
            try:
                requests.get(addr)
            except:
                time.sleep(.01)
            else:
                break
        else:
            assert False, 'server never came up'
        yield addr
    finally:
        proc.terminate()

if __name__ == '__main__':
    pytest.main([__file__, '-svvx', '--tb', 'native'])
