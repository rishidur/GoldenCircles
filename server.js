// server.js (Node.js)
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// Connect to MongoDB
mongoose.connect('', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

// Define your schema
const requestSchema = new mongoose.Schema({
  name: String,
  email: String,
  phone: String,
  travelDate: String,
  fromAirport: String,
  toAirport: String,
  layover: String,
  flightNumberFirstLeg: String,
  flightNumberSecondLeg: String,
  airline: String,
  assistanceReason: String,
  comments: String,
});

// Create a model
const Request = mongoose.model('Request', requestSchema);

// API route to submit a request
app.post('/requests', async (req, res) => {
  const newRequest = new Request(req.body);
  await newRequest.save();
  res.status(201).send(newRequest);
});

// Start the server
app.listen(3000, () => {
  console.log('Server is running on http://localhost:3000');
});
