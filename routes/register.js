const express = require('express');
const router = express.Router();
const mySqlPool = require('../db');
const bcrypt= require("bcrypt");
router.post('/register', async (req, res) => {
    const { role, email, password, fullname, contact, student_usn, dept, room_no, employee_id } = req.body;

    console.log('Received data:', req.body); // Log incoming data

    if (!role || !email || !password || !fullname || !contact) {
        return res.status(400).send({ error: 'Required fields are missing' });
    }

    try {
        if (role === 'student') {
            if (!student_usn || !dept || !room_no) {
                return res.status(400).send({ error: 'Student-specific fields are missing' });
            }

            await mySqlPool.query(
                `INSERT INTO STUDENT (Student_usn, Name, Dept, Room_no, Email_id, Password, Contact, Health_status) 
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
                [student_usn, fullname, dept, room_no, email, password, contact, 'Healthy']
            );
        } else if (role === 'warden') {
            if (!employee_id) {
                return res.status(400).send({ error: 'Warden-specific fields are missing' });
            }

            await mySqlPool.query(
                `INSERT INTO WARDEN (Employee_id, Name, Email_id, Password, Contact_no) 
                 VALUES (?, ?, ?, ?, ?)`,
                [employee_id, fullname, email, password, contact]
            );
        } else {
            return res.status(400).send({ error: 'Invalid role specified' });
        }

        res.status(201).send({ message: 'User registered successfully' });
    } catch (error) {
        console.error('Register Error:', error.message);
        res.status(500).send({ error: 'Database error: ' + error.message });
    }
});

module.exports = router;
