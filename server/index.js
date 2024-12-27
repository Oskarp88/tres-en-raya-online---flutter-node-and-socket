const express = require('express');
const http = require('http');
const colors = require('colors');
const connectDB = require('./src/config/db');
const dotenv = require('dotenv');
const {Server} = require('socket.io');
const cors = require('cors');



dotenv.config();

const app = express();

const port = process.env.PORT || 3000;

const server = http.createServer(app);
//middleware
app.use(express.json());
app.use(cors());

const io = new Server(server);

connectDB();

server.listen(port, '0.0.0.0', () =>{
    console.log(`Server started and running on port ${port}`.bgCyan.white)
})