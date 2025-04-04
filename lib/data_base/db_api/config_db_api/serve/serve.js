require('dotenv').config();
const express = require('express');
const app = express();
const db = require('../db/db');
const cors = require('cors');

app.use(cors());
app.use(express.json());

const Routes1 = require('../lib/config/routes1/');
const Routes2 = require('../lib/config/routes2/');

app.use('/routes1', Routes1);
app.use('/routes2', Routes2);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log("Servidor rodando em http://localhost:${PORT}");
});