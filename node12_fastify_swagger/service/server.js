'use strict';

const fastify = require('fastify')(
{
  logger: 
  {
    level: 'trace',
    prettyPrint: true
  }
});

const API_PORT = process.env.API_PORT || 1300;

fastify.register(require('fastify-swagger'), 
{
  swagger: 
  {
    info: 
    {
      title: 'API - Generated spec',
    },
    host: 'localhost',
    schemes: ['http'],
    consumes: ['application/json'],
    produces: ['application/json']
  },
  exposeRoute: true,
  routePrefix: '/spec'
});


fastify.get('/', 
{
  schema: 
  {
    summary: 'get root',
  }
},
async (request, reply) => 
{
  fastify.log.info(`GET /`);

  const out =
  { 
  	status: 'success',
  	info: 'yes!!!',
  	stack: 'node',
  	framework: 'fastify'
  };

  return out;
});

fastify.get('/info', 
{
  schema: 
  {
    summary: 'get info',
    response: 
    {
      200: 
      {
        description: 'success',
        type: 'object',
        properties: 
        {
          status: { type: 'string' },
          method: { type: 'string' },
          endpoint: { type: 'string' }
        }
      }
    }
  }
},
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

fastify.put('/records/:id', 
{
  schema: 
  {
    summary: 'update record',
    params: 
    {
      type: 'object',
      properties: 
      {
        id: 
        {
          type: 'string',
          description: 'record id'
        }
      }
    },
    response: 
    {
      200: 
      {
        description: 'success',
        type: 'object',
	    properties: 
	    {
	      status: { type: 'string' },
	      method: { type: 'string' },
	      endpoint: { type: 'string' }
	    }
      }
    }
  }
},
async (request, reply) => 
{
  fastify.log.info(`PUT /records/:id`);

  const out =
  { 
  	status: 'success',
  	method: 'put',
  	endpoint: '/records/:id'
  };

  return out;
});

fastify.ready(err => 
{
  if (err) throw err

  fastify.swagger();
});

fastify.listen(API_PORT, '0.0.0.0',
(err, address) => 
{
  if (err) throw err

  fastify.log.info(`server listening on ${address}`);
});
