const express = require('express')
const app = express()
 
app.get('/', function (req, res) {
    console.log("GET /")
    res.send({status: 'success', message: 'Hello World!', stack: 'node', framework: 'express'})
})
 
app.listen(1300)