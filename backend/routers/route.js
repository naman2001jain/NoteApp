
const express = require("express")
const app = express()
var Data = require("../Models/NoteSchema")

//create a note
//POST request

app.post("/create", (req, res) => {
    var note = new Data({
        note: req.get("note"),
        title: req.get("title"),
        date: req.get("date")
    })
    note.save().then(() => {
        if(note.isNew == false){
            console.log("data saved!")
            res.send("data saved!")
        }else{
            console.log("Failed to save data")
        }
    })
})


//delete a note
//delete request
app.delete("/delete", (req, res) => {
    Data.deleteOne({_id: req.get("id")}).then(() => {
        console.log("data deleted!")
        res.send("data deleted!")
    }).catch(() => {
        console.log("failed to delete data")
    })
})

//delete all records
app.delete("/deleteAll", (req, res) => {
    Data.deleteMany({}).then(() => {
        console.log("data deleted!")
        res.send("data deleted!")
    }).catch(() => {
        console.log("failed to delete data")
    })
})

//update a note
//PATCH request


app.patch("/update", (req, res) => {
    Data.updateOne({_id: req.get("id")}, {$set: {
        note: req.get("note"),
        title: req.get("title"),
        date: req.get("date")
    }
    }).then(() => {
        console.log("data updated!")
        res.send("data updated!")
    }
    ).catch(() => {
        console.log("failed to update data")
    })
})


//Fetch all notes
//GET request
app.get("/fetch", (req, res) => {
    Data.find({}).then((dbItems) => {
        res.send(dbItems)
    }).then(() => {
        console.log("fetched data")
    }
    ).catch(() => {
        console.log("failed to fetch data")
    })
})

module.exports = app