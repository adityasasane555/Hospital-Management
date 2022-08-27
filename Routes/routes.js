const express = require("express");
const router = express.Router();
const conn = require("../mysqlDB/db.js");
const upload = require("../Middleware/multer.js");
const validatePhoneNumber = require("validate-phone-number-node-js");

const emailRegex = require("../Validator/email.js");
const phoneRegex = require("../Validator/phone.js");
const passwordRegex = require("../Validator/password.js");

router.post("/newpatientregistration", upload.single("photo"), (req, res) => {
    let Name = req.body.name;
    let Address = req.body.address;
    let Email = req.body.email;
    let Phone_number = req.body.phone;
    let Password = req.body.password;
    let Photo = req.file.filename;
    let PsychiatristsID = req.body.psychiatristsid;

    if (Address.length < 10) {
        res.send("Please Enter Your Full Address!");
        return 0;
    }

    if (!emailRegex.test(Email)) {
        res.send("Please Enter valid email address!");
        return 0;
    }

    if (!phoneRegex.test(Phone_number)) {
        res.send("Please Enter valid phone number!");
        return 0;
    }

    if (!passwordRegex.test(Password)) {
        res.send("Please Enter valid password!");
        return 0;
    }

    var sql = "INSERT INTO `patients`(`Name`, `Address`, `Email`, `Phone`, `Password`, `Photo`, `PsychiatristsID`) VALUES ('" + Name + "','" + Address + "','" + Email + "','" + Phone_number + "','" + Password + "','" + Photo + "','" + PsychiatristsID + "')";
    conn.query(sql, (err, res) => {
        if (err) {
            throw err;
        } else {
            console.log("Result: " + res);
        }
    });

    var query = "SELECT patientscount FROM `psychiatrists` WHERE PsychiatristsID =" + PsychiatristsID;
    conn.query(query, (err, data) => {
        if (!err) {
            data.forEach(element => {
                let count = element.patientscount;
                count++;
                conn.query("UPDATE `psychiatrists` SET `PatientsCount`='" + count + "' WHERE PsychiatristsID =" + PsychiatristsID, (err, data) => {
                    if (!err) {
                        console.log("Success!");
                    }
                });
            });
        }
    });


});


router.get("/getpsychiatrists/:id", (req, res) => {
    let id = req.params.id;

    var sql = "SELECT h.HName AS HospitalName,COUNT(p.PsychiatristsID) AS PsychiatristsCount FROM psychiatrists p INNER JOIN hospitals h ON p.HID = h.HID WHERE p.HID =" + id + " UNION SELECT pat.Name, COUNT(pat.Name) AS PatientsCount FROM patients pat INNER JOIN psychiatrists p ON p.PsychiatristsID = pat.PsychiatristsID WHERE p.HID =" + id;
    var Query = "SELECT PsychiatristsID,PsychiatristsName,patientscount FROM `psychiatrists` WHERE HID =" + id;

    conn.query(sql, (err, data) => {
        if (err) {
            throw err;
        } else {
            res.write("Hospital Name: " + data[0].HospitalName + "\n");
            res.write("Psychiatrists Count : " + data[0].PsychiatristsCount + "\n");
            res.write("Patients Count: " + data[1].PsychiatristsCount + "\n\n");
        }
    });

    //
    conn.query(Query, (err, result) => {
        if (!err) {
            result.forEach(element => {
                res.write("ID: " + element.PsychiatristsID + "\n");
                res.write("Name: " + element.PsychiatristsName + "\n");
                res.write("Patients Count: " + element.patientscount + "\n\n");
            });

        }
        res.end();
    });

});


module.exports = router;

