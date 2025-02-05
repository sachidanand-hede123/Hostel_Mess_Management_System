const express = require('express');
const colors = require('colors');
const morgan = require('morgan');
const dotenv = require('dotenv');
const cors = require('cors');
const mySqlPool = require('./db');
const registerRoutes = require('./routes/register');
const loginRoutes = require('./routes/login');

dotenv.config();

const app = express();

// Middleware
app.use(morgan('dev'));
app.use(express.json());
app.use(cors());



// Routes
app.use('/api', registerRoutes);
app.use('/api', loginRoutes);

// Test Route
app.get('/test', (req, res) => {
    res.status(200).send('<h1>Node.js MySQL App</h1>');
});

// Get student details
app.get('/api/student/:usn', async (req, res) => {
    const { usn } = req.params;

    try {
        const [result] = await mySqlPool.query('SELECT * FROM STUDENT WHERE Student_usn = ?', [usn]);
        if (result.length) {
            res.json(result[0]);
        } else {
            res.status(404).json({ error: 'Student not found' });
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Server error' });
    }
});

// Update student details
app.put('/api/student/:usn', async (req, res) => {
    const { usn } = req.params;
    const { room, contact } = req.body;

    try {
        const [result] = await mySqlPool.query(
            'UPDATE STUDENT SET Room_no = ?, Contact = ? WHERE Student_usn = ?',
            [room, contact, usn]
        );

        if (result.affectedRows) {
            res.json({ message: 'Profile updated successfully' });
        } else {
            res.status(404).json({ error: 'Student not found' });
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Server error' });
    }
});



// Get Weekly Menu
app.get('/api/menu', async (req, res) => {
    try {
        const [menu] = await mySqlPool.query('SELECT day, breakfast, lunch, high_tea, dinner FROM WeeklyMenu');
        res.json(menu);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Server error' });
    }
});

// today menu
app.get('/api/todays-menu', async (req, res) => {
    try {
        // Get the current day name (e.g., 'Monday')
        const day = new Date().toLocaleString('en-US', { weekday: 'long' });

        // Query the database for today's menu
        const [result] = await mySqlPool.query(
            'SELECT breakfast, lunch, high_tea, dinner FROM WeeklyMenu WHERE day = ?',
            [day]
        );

        if (result.length) {
            res.json(result[0]); // Send today's menu
        } else {
            res.status(404).json({ error: 'Menu not found for today' });
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Server error' });
    }
});

// update the menu from warden
app.post('/api/menu', async (req, res) => {
    const { menu } = req.body;

    // Log received data to check structure
    console.log('Received menu:', JSON.stringify(menu, null, 2));

    if (!menu || !Array.isArray(menu)) {
        console.error('Invalid menu format received');
        return res.status(400).json({ error: 'Invalid menu format.' });
    }

    try {
        const daysOrder = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

        for (const item of menu) {
            if (!daysOrder.includes(item.day) || !item.breakfast || !item.lunch || !item.high_tea || !item.dinner) {
                console.error('Invalid item data:', item);
                return res.status(400).json({ error: 'Invalid item data received.' });
            }

            console.log('Updating menu item:', item);  // Log each update attempt
            const result = await mySqlPool.query(
                'UPDATE WeeklyMenu SET breakfast = ?, lunch = ?, high_tea = ?, dinner = ? WHERE day = ?',
                [item.breakfast, item.lunch, item.high_tea, item.dinner, item.day]
            );

            console.log('Update result:', result);  // Log query result
        }

        res.status(200).send('Menu updated successfully.');
    } catch (error) {
        console.error('Error while updating menu:', error); // Log the error
        res.status(500).json({ error: 'Failed to update the menu.' });
    }
});

// send feedback
app.post('/submit-feedback', async (req, res) => {
    const { Student_usn, Rating, Comments } = req.body;

    if (!Student_usn || !Rating || !Comments) {
        return res.status(400).json({ error: 'All fields are required.' });
    }

    const query = `
        INSERT INTO feedback (Date, Student_usn, Rating, Comments)
        VALUES (CURDATE(), ?, ?, ?)
    `;

    try {
        const [result] = await mySqlPool.query(query, [Student_usn, Rating, Comments]);
        res.status(200).json({ message: 'Feedback saved successfully.', result });
    } catch (error) {
        console.error('Error inserting feedback:', error);
        res.status(500).json({ error: 'Failed to save feedback.' });
    }
});

// Get all feedback, sorted by date (latest first)
app.get('/api/feedback', async (req, res) => {
    try {
        const [feedback] = await mySqlPool.query(
            'SELECT Feedback_id, Date, Student_usn, Rating, Comments FROM feedback ORDER BY Date DESC'
        );
        res.json(feedback);
    } catch (error) {
        console.error('Error fetching feedback:', error);
        res.status(500).json({ error: 'Failed to fetch feedback.' });
    }
});

const QRCode = require('qrcode'); // Import QR Code library

// Generate a ticket and save it in the database
app.post('/api/generate-ticket', async (req, res) => {
    const { usn, mealType } = req.body;

    console.log('Received data:', usn, mealType); // Log the received data

    if (!usn || !mealType) {
        return res.status(400).json({ error: 'USN and Meal Type are required.' });
    }

    try {
        // Retrieve student name using USN
        const [studentResult] = await mySqlPool.query('SELECT Name FROM STUDENT WHERE Student_usn = ?', [usn]);

        console.log('Student Result:', studentResult); // Log the result

        if (!studentResult.length) {
            return res.status(404).json({ error: 'Student not found.' });
        }

        const name = studentResult[0].Name;
        const currentDate = new Date().toLocaleDateString('en-GB', { timeZone: 'Asia/Kolkata' }).split('/').reverse().join('-');;
        const currentTime = new Date();

        // Generate Token ID (max Token_id + 1)
        const [maxTokenIdResult] = await mySqlPool.query('SELECT MAX(Token_id) AS maxTokenId FROM Token');
        console.log('Max Token ID Result:', maxTokenIdResult); // Log max token ID

        const newTokenId = (maxTokenIdResult[0].maxTokenId || 0) + 1;

        // Insert into the Token table
        const [insertResult] = await mySqlPool.query(
            'INSERT INTO Token (Token_id, MealCategory, Date, IssuedTime, Student_usn) VALUES (?, ?, ?, ?, ?)',
            [newTokenId, mealType, currentDate, currentTime, usn]
        );

        console.log('Insert Result:', insertResult); // Log the insert result

        const tokenId = insertResult.insertId;

      // Generate QR Code with Token ID included
        const ticketDetails = `
TokenID: ${newTokenId}'       '            
Name: ${name}'     '          
USN: ${usn}'   '                
Meal Type: ${mealType}'         '
Date: ${currentDate}'      '
Issued Time: ${currentTime.toISOString()}
        `;

        // Generate QR Code
        const qrCodeData = await QRCode.toDataURL(ticketDetails.trim());
        console.log('QR Code Data:', qrCodeData); // Log the QR Code Data

        // Send successful response
        res.status(200).json({
            message: 'Ticket generated successfully.',
            ticket: {
                TokenID: tokenId,
                Name: name,
                USN: usn,
                MealType: mealType,
                Date: currentDate,
                QRCode: qrCodeData,
            },
        });

    } catch (error) {
        console.error('Error generating ticket:', error); // Log the error
        res.status(500).json({ error: 'Failed to generate ticket.' });
    }
});


//bill
app.get('/api/tokens/:usn', async (req, res) => {
    const { usn } = req.params;

    try {
        const prices = { breakfast: 30, lunch: 40, hightea: 20, dinner: 40 };

const query = `
    SELECT MealCategory, COUNT(*) as qty 
    FROM Token 
    WHERE Student_usn = ? 
    GROUP BY MealCategory
`;
const [result] = await mySqlPool.query(query, [usn]);

const tokens = {};
let total = 0;

result.forEach(({ MealCategory, qty }) => {
    const normalizedCategory = MealCategory.toLowerCase().replace(/\s+/g, ''); // e.g., 'High Tea' -> 'hitea'
    const price = prices[normalizedCategory];
    const categoryTotal = qty * price;
    tokens[normalizedCategory] = { qty, total: categoryTotal };
    total += categoryTotal;
});

res.json({
    breakfast: tokens.breakfast || { qty: 0, total: 0 },
    lunch: tokens.lunch || { qty: 0, total: 0 },
    hightea: tokens.hightea || { qty: 0, total: 0 },
    dinner: tokens.dinner || { qty: 0, total: 0 },
    total,
});

    } catch (error) {
        console.error('Error fetching tokens:', error);
        res.status(500).json({ error: 'Failed to fetch token data.' });
    }
});



// delivery 
app.post('/delivery', async (req, res) => {

    const { usn, meal_type, date } = req.body;
    console.log('Received delivery request:', req.body);
    // Validate required fields
    if (!usn || !meal_type || !date) {
      return res.status(400).json({ message: 'Missing required fields: usn, meal_type, and date are required.' });
    }
  
    try {
      // Get the next token_id (this part is from the /get-next-token-id endpoint)
      const [tokenResults] = await mySqlPool.query('SELECT MAX(token_id) AS max_token_id FROM token');
      const nextTokenId = tokenResults[0].max_token_id ? tokenResults[0].max_token_id + 1 : 1;
  
      // Insert delivery data into the delivery table, and assign the next token_id
      const query = 'INSERT INTO delivery (usn, meal_type, date, meal_id) VALUES (?, ?, ?, ?)';
      const [result] = await mySqlPool.query(query, [usn, meal_type, date, nextTokenId]);
  
      // Return success response
      res.status(200).json({
        message: 'Delivery information saved successfully!',
        delivery: {
          delivery_id: result.insertId,
          usn,
          meal_type,
          date,
          token_id: nextTokenId,  // Return the next token_id generated
        },
      });
    } catch (error) {
      console.error('Error saving delivery info:', error);
      res.status(500).json({ message: 'Error saving delivery info', error });
    }
  });

  
// Get delivery requests for today
app.get('/api/todays-deliveries', async (req, res) => {
    try {
        const today = new Date().toLocaleDateString('en-GB', { timeZone: 'Asia/Kolkata' }).split('/').reverse().join('-');
 // Get today's date in YYYY-MM-DD format

        // Query to join delivery and student tables and fetch today's deliveries
        const query = `
            SELECT 
                d.usn, 
                s.Name, 
                s.Room_no, 
                d.meal_id, 
                d.meal_type, 
                d.date
            FROM 
                delivery d
            JOIN 
                student s 
            ON 
                d.usn = s.Student_usn
            WHERE 
                d.date = ?
        `;

        const [deliveries] = await mySqlPool.query(query, [today]);

        // Respond with the result
        res.status(200).json(deliveries);
    } catch (error) {
        console.error('Error fetching deliveries:', error);
        res.status(500).json({ error: 'Failed to fetch delivery data.' });
    }
});

  
// Start the server
const PORT = process.env.PORT || 8000;

mySqlPool
    .query('SELECT 1')
    .then(() => {
        console.log('MYSQL DB connected'.bgCyan.white);
        app.listen(PORT, () => {
            console.log(`Server running on port ${PORT}`.bgMagenta.white);
        });
    })
    .catch((error) => {
        console.error('Error connecting to MySQL DB:', error.message);
    });
