const express = require("express");
const bodyparser = require("body-parser");
const routes = require("./Routes/routes.js");

const app = express();
app.use(bodyparser.urlencoded({extended : true}));
app.use('/newpatientregistration', express.static('Uploads'));

app.use("/",routes);

app.listen(8000,(req,res)=>{
   console.log("Server is running on 8000"); 
});