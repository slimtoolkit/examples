
var Hapi = require('hapi');

var server = new Hapi.Server();
server.connection(
{
    port: 1300 
});

server.route(
{
    method: 'GET',
    path:'/', 
    handler: function (request, reply) 
    {
       console.log('node service: GET /');
       reply({status: 'success', message: 'Hello World', stack: 'node', stackversion: process.version,framework: 'hapi', frameworkversion: Hapi.frameworkversion, packagemanager: "npm", baseimageversion: "Ubuntu 20.04"});
    }
});


server.start(function()
{
	console.log('node service: ', server.info.uri);
});
