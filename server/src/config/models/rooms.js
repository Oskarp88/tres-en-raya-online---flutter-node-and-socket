const mongoose = require('mongoose');
const playerSchema = require('./player');

const roomShema = new mongoose.Schema({
    occupancy: {
        typeo: Number,
        default: 2,
    },
    maxRounds: {
        type: Number,
        default: 6
    },
    currentRound: {
        required: true,
        type: Number,
        default: 1,
    },
    players: [playerSchema],
    isJoin: {
        type: Boolean,
        default: true,
    },
    turn: playerSchema,
    turnIndex: {
        type: Number,
        default: 0,
    }
});

const roomModel = mongoose.model('Room', roomShema);
module.exports = roomModel;

