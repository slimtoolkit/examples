'use strict';

const fastify = require('fastify')(
{
  logger: 
  {
    level: 'trace',
    prettyPrint: true
  },
  http2: true //plain text http2
});

const API_PORT = process.env.API_PORT || 1300;

// h2url http://localhost:1300
// http2 GET http://localhost:1300

fastify.get('/',
async (request, reply) => 
{
  fastify.log.info(`GET /`);

  const out =
  { 
  	status: 'success',
  	message: 'Hello World!',
  	stack: 'node.http2c',
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

  fastify.log.info(`http2c server listening on ${address}`);
});
