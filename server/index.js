//express and mongoose:
const express = require('express'); 
const mongoose = require('mongoose'); 
const authRouter = require('./routes/auth');

const PORT = process.env.PORT || 3000;

const app = express();

app.use(express.json());
app.use(authRouter);

const db = "mongodb+srv://sarthaksahoo1520:Jb8u70o7K9uyvfdz@cluster0.50bqchx.mongodb.net/?retryWrites=true&w=majority";
mongoose
    .connect(db)
    .then(()=> console.log("MongoDB connected"))
    .catch((e)=>{console.log(e)});


app.listen(PORT, "0.0.0.0", ()=>{
    console.log(`connected at port ${PORT}`);

});



// Jb8u70o7K9uyvfdz