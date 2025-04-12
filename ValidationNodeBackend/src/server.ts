import http from 'http';
require("dotenv").config();

const app = require('./app');
const port = process.env.PORT ;
const server = http.createServer(app)

server.listen(port, () => {
    console.log(`Yoooooo Listening on port ${port} on ${process.env.DOMAIN_NAME}`);
})