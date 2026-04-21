// Vercel Serverless Function Bridge
const app = require('../src/index.js');
module.exports = app;

// Disable Vercel's default body parser so `multer` doesn't hang!
module.exports.config = {
    api: {
        bodyParser: false,
    },
};
