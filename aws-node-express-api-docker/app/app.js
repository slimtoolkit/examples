const serverless = require("serverless-http");
const express = require("express");
const { json } = require("express");
const axios = require('axios').default;

const app = express();

app.use(
  express.urlencoded({
    extended: true
  })
);

app.use(express.json());

app.get("/", (req, res, next) => {
  console.log("GET /");
  return res.status(200).json(
    {
      message: "GET / - ok",
    });
});

app.get("/hello", (req, res) => {
  console.log("GET /hello - UA => %s", req.header('User-Agent'));



  return res.status(200).json(
    {
      status: "ok",
      call: "GET /hello",
      data: req.header('User-Agent')
    });
});

app.post("/stuff", (req, res) => {
  console.log("POST /stuff - body => %s", req.body);

  return res.status(200).json(
    {
      status: "ok",
      call: "POST /stuff",
      data: JSON.stringify(req.body)
    });
});

app.get("/get", async (req, res) => {
  console.log("get");

  let x = await axios.get('https://httpbin.org/get');
  console.log(x.data);


  return res.send(x.data);
});

app.use((req, res, next) => {
  return res.status(404).json(
    {
      error: "Not Found",
    });
});

module.exports.handler = serverless(app);
