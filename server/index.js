const express = require('express');
const http = require('http');
const colors = require('colors');
const connectDB = require('./src/config/db');
const dotenv = require('dotenv');
const {Server} = require('socket.io');
const cors = require('cors');
const Room = require('./src/config/models/rooms');

dotenv.config();

const app = express();

const port = process.env.PORT || 3000;

const server = http.createServer(app);
//middleware
app.use(express.json());
app.use(cors());

const io = new Server(server,{
    cors: {
        origin:["http://192.168.x.x:3000"],
        method: ["GET", "POST",'PUT', 'DELETE'],
      }
});

io.on("connection", (socket) => {
    console.log(`user connected! Id: ${socket.id}`.bgGreen)
    socket.on('createRoom', async({nickname})=>{
        try {
            let room = new Room();
            const player = {
                socketID: socket.id,
                nickname,
                playerType: 'X',
            }
            room.players.push(player);
            room.turn = player;
            
            room = await room.save();
            console.log(room)
            const roomID = room._id.toString;
            socket.join(roomID);
            io.to(roomID).emit('createRoomSuccess', room)
        } catch (error) {
            console.log(error);
        }
    })
})

connectDB();

server.listen(port, '0.0.0.0', () =>{
    console.log(`Server started and running on port ${port}`.bgCyan.white)
})