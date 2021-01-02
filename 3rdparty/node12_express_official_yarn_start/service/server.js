'use strict';

const express = require('express');

// Constants
const PORT = 1300;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World (with yarn)');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
