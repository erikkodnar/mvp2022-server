require('dotenv').config()
const Pool = require('pg').Pool;
const pool = new Pool({
  user: process.env.USER,
  host: process.env.HOST,
  database: process.env.DB,
  password: process.env.PASSWORD,
  port: process.env.PORT,
});

module.exports = {
  query: (text, params, callback) => {
      return pool.query(text, params, callback);
  },
  connect: (err, client, done) => {
      return pool.connect(err, client, done);
  },
};
