const express = require('express');
const app = express();
const PORT = 5000;

app.get('/', (req, res) => {
    res.json({
        status: "success",
        message: "Production Landing Zone Deployment Live!",
        environment: "prod",
        timestamp: new Date()
    });
});

app.get('/health', (req, res) => {
    res.status(200).json({ status: "healthy", uptime: process.uptime() });
});

app.listen(PORT, '0.0.0.0', () => {
    console.log(`Server running on port ${PORT}`);
});