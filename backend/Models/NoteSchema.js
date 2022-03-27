const mongoose = require("mongoose")
const Schema = mongoose.Schema

var note = new Schema({
    title: String,
    date: String,
    note:  String
})

const Data = mongoose.model("Data", note)

module.exports = Data