'use strict';

const hapi = require('@hapi/hapi');
const fs = require('fs');

const server = hapi.server(
{
    port: 1300
});

server.route(
{
    method: 'GET',
    path:'/', 
    handler: (request, h) => 
    {
       console.log('node/hapi service: GET /');
       console.log('node/hapi service GET / - headers: %s', request.headers);
       try
       {
        fs.appendFileSync('dummyfile', 'GET /\n');
       } 
       catch(error)
       {
        console.log(error);
       }
       return {status: 'success', message: 'Hello World!', stack: 'node', framework: 'hapi'};
    }
});

server.route(
{
    method: 'POST',
    path:'/post', 
    handler: (request, h) => 
    {
       console.log('node/hapi service POST /post');
       console.log('node/hapi service POST /post - headers: %s', request.headers);
       console.log('node/hapi service POST /post - body: ', request.payload);
       try
       {
        fs.appendFileSync('dummyfile', 'POST /post\n');
       } 
       catch(error)
       {
        console.log(error);
       }
       return {status: 'success', info: 'yes!!!', stack: 'node', framework: 'hapi'};
    }
});

const init = async () => 
{
    await server.start();
    console.log(`node service: ${server.info.uri}`);
};

process.on('unhandledRejection', (err) =>
{
    console.log(err);
    process.exit(1);
});

init();
