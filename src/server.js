
const express = require('express');
const os = require('os');
const logger = require('./loggers/logger');

const app = express();
const port = 8080;

// Generic handler for all routes
app.use((req, res) => {
  logger.debug(`Request: ${req.method} ${req.url}`);
  res.send(`You've hit ${os.hostname()}\n`);
});

app.listen(port, () => {
  logger.debug(`Node app listening at http://localhost:${port}`)
});
