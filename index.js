const express = require('express');
const socketio = require('socket.io')
const path = require('path')
const logger = require('morgan')
var cors = require('cors');

const app = express();

app.use(cors())
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

let http = require("http").Server(app);
// set up socket.io and bind it to our
// http server.
let io = require("socket.io")(http);

app.get("/", (req, res) => {
  res.sendFile(path.resolve("./client/index.html"));
});

// whenever a user connects on port 3000 via
// a websocket, log that a user has connected
io.on("connection", function(socket) {
  console.log("a user connected");
  socket.on("message", (message) => {
    console.log(message)
  })
});

module.exports = {app};
