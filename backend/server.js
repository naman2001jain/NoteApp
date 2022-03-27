const express = require("express")
const mongoose = require("mongoose")
const app = express()

//connecting to mongodb
mongoose.connect("mongodb://localhost/notesDB1")

mongoose.connection.on("connected", () => {
    console.log("connected to mongodb")
}).on("error", (err) => {
    console.log("error connecting to mongodb", err)})


//Route to route.js
const router = require("./routers/route")
app.use('/route',router)

//creating a server listening on the port
//https://localhost:8080/route/create
app.listen(8080 , "localhost", () => {
    console.log("server is running on port 8080")
})


