'use strict';

const fs = require('fs');
const path = require('path');
const fastify = require('fastify')(
{
  logger: 
  {
    level: 'trace',
    prettyPrint: true
  },
  http2: true,
  https: {
    key: fs.readFileSync(path.join(__dirname, 'server.key')),
    cert: fs.readFileSync(path.join(__dirname, 'server.cert'))
  }
});

const API_PORT = process.env.API_PORT || 1300;

// h2url https://localhost:1300
// http2 GET https://localhost:1300

fastify.get('/',
async (request, reply) => 
{
  fastify.log.info(`GET /`);

  const out =
  { 
  	status: 'success',
  	message: 'Hello World!',
  	stack: 'node.http2',
  	framework: 'fastify'
  };
  
  return out;
});

fastify.get('/info',
async (request, reply) => 
{
  fastify.log.info(`GET /info`);

  const out =
  { 
  	status: 'success',
  	method: 'get',
  	endpoint: '/info'
  };

  return out;
});

fastify.listen(API_PORT, '0.0.0.0',
(err, address) => 
{
  if (err) throw err

  fastify.log.info(`http2 server listening on ${address}`);
});
