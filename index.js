const express = require('express');
const { Server } = require("socket.io");
const path = require('path');
const logger = require('morgan');
var cors = require('cors');
require('dotenv').config();

const http = require('http');

const app = express();
const server = http.createServer(app);
const io = new Server(server);


app.use(cors());
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));



server.listen(process.env.IO_PORT);
console.log(process.env.IO_PORT)
app.get("/", (req, res) => {
  res.sendFile(path.resolve("./client/index.html"));
});

// whenever a user connects on port 3000 via
// a websocket, log that a user has connected
io.on("connection", function(socket) {
  console.log("a user connected");
  socket.on("message", (message) => {
    console.log(message)
  });
});

module.exports = {app};
