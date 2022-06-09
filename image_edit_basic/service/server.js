const Hapi = require('@hapi/hapi');

const init = async () => {
    const server = Hapi.server({
        port: 1300,
    });

    server.route({
        method: 'GET',
        path: '/',
        handler: (request, h) => {
            console.log('node service: GET /');
            return {status: 'success', message: 'Hello World', stack: 'node'};
        }
    });

    await server.start();
    console.log('Server running on %s', server.info.uri);
};

process.on('unhandledRejection', (err) => {
    console.log(err);
    process.exit(1);
});

init();
