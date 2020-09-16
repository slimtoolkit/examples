'use strict';

const express = require('express');
const { Server } = require('ws');

const PORT = process.env.PORT || 1300;
const INDEX = '/index.html';

const server = express()
  .use((req, res) => res.sendFile(INDEX, { root: __dirname }))
  .listen(PORT, () => console.log(`Listening on ${PORT}`));

const wss = new Server({ server });

wss.on('connection', (ws, req) => 
{
  console.log('ws - client connected / headers => %s', req.headers);

  ws.on('message', (msg) => 
  {
  	console.log(`ws - got message -> "${msg}"`);
  	//send it to other connected clients
  	wss.clients.forEach((client) => 
  	{
  		if (client != ws)
  		{
  			client.send(`broadcast: ${msg}`);
  		}
  	});
  });

  ws.on('ping', (data) => 
  {
    console.log(`ws - client ping - ${data}`);
  });

  ws.on('pong', (data) => 
  {
    console.log(`ws - client pong - ${data}`);
  });

  ws.on('unexpected-response', (req, rsp) => 
  {
    console.log('ws - client unexpected-response');
  });

  ws.on('close', () => 
  {
  	console.log('ws - client disconnected');
  });
});

setInterval(() => 
{
  wss.clients.forEach((client) => 
  {
  	const now = new Date().toTimeString();
    client.send(`event: ${now}`);
  });
}, 1000);
