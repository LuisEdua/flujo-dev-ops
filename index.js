const express = require('express');
const app = express();
const port = 3000;

app.get('/api/v1/practica', (req, res) => {
  res.send('Hello, World! Prueba');
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});