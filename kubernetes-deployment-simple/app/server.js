'use strict';

const Hapi = require('hapi');
const Redis = require('redis');

const rclient = Redis.createClient({host: 'my-k8s-app-redis.default.svc.cluster.local', port: 16379});

rclient.on('connect', () => 
{
    console.log('Redis client connected');
});

rclient.on('error', (err) => 
{
    console.log('Redis error - ' + err);
});

const server = Hapi.server(
{
    port: 1300
});

server.route(
{
    method: 'GET',
    path: '/',
    handler: (request, h) =>
    {
        console.log('node service: GET /');

        return new Promise((resolve,reject) => 
        {
            rclient.incr('hapi.call', (err,count) =>
            {
                if (err) 
                {
                    console.log(`redis op error - ${err}`);
                }

                var result =
                {
                    count: count,
                    status: 'success',
                    info: 'yes!!',
                    service: 'node.compose',
                    version: process.version
                };

                resolve(result);
            });
        });
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
