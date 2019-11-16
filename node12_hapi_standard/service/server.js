'use strict';

const Hapi = require('@hapi/hapi');

const server = Hapi.server(
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
