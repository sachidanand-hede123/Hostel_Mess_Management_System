const express = require('express');
const router = express.Router();
const mySqlPool = require('../db');

router.post('/login', async (req, res) => {
    const { role, usn, password } = req.body;

    // Check for missing fields
    if (!role || !usn || !password) {
        return res.status(400).send({ error: 'All fields are required' });
    }

    try {
        if (role === 'student') {
            // Query the database for the student role
            const [rows] = await mySqlPool.query(
                `SELECT * FROM STUDENT WHERE Student_usn = ? AND Password = ?`,
                [usn, password]
            );

            if (rows.length > 0) {
                res.status(200).send({ message: 'Login successful', user: rows[0] });
            } else {
                res.status(401).send({ error: 'Invalid credentials' });
            }
        } else if (role === 'warden') {
            // Query the database for the warden role
            const [rows] = await mySqlPool.query(
                `SELECT * FROM WARDEN WHERE Employee_id = ? AND Password = ?`,
                [usn, password]
            );

            if (rows.length > 0) {
                res.status(200).send({ message: 'Login successful', user: rows[0] });
            } else {
                res.status(401).send({ error: 'Invalid credentials' });
            }
        } else {
            // Unsupported role
            return res.status(400).send({ error: `Role "${role}" is not supported` });
        }
    } catch (error) {
        console.error('Login Error:', error.message);
        res.status(500).send({ error: 'Database error: ' + error.message });
    }
});

module.exports = router;
