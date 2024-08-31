import express from 'express';
import fs from "fs";

const app =express();

const redData =() =>{
    try {
    const data = fs.readFileSync("./db.json");
    return JSON.parse(data);
    } catch (error){
        console.log(error);

    }
};

const writeData =(data) =>{
    try {
      fs.writeFileSync("./db.json", JSON.stringify(data));
    } catch (error) {
        console.log(error);
    }
};


app.get("/", (req,res) =>{
    res.send("Welcome to my first API witj Node js");
});

app.get("/gestion_de_proyectos", (req,res) => {
    const data = redData();
    res.json(data.gestion_de_proyectos);

});


app.listen(3000,() =>{
    console.log('Server listening on port 3000');
});