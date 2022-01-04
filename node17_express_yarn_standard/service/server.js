const express = require('express')
const app = express()
 
app.get('/', function (req, res) {
    console.log("GET /")
    res.send({status: 'success', message: 'Hello World', stack: 'node', stackversion: process.version,framework: 'express', frameworkversion: express.version, packagemanager: "yarn", baseimageversion: "Debian 11 (bullseye)"})
})
 
app.listen(1300)