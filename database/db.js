const mysql = require("mysql");

const con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "hospital",
});

con.connect((err) => {
  if (err) {
    throw err;
  } else {
    console.log("connected!");
  }
});

module.exports = con;
