const express = require('express');
const http = require('http');
const colors = require('colors');

const app = express();

const port = process.env.PORT || 3000;

let server = http.createServer(app);

let io = require('socket.io')(server);

//middleware
app.use(express.json());

server.listen(port, '0.0.0.0', () =>{
    console.log(`Server started and running on port ${port}`.bgCyan.white)
})