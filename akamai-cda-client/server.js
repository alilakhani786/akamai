const express = require("express");
const path = require('path');
const app = express();

app.use(express.static(path.join(__dirname, 'public')));

app.set('view engine', 'pug');

/*
app.get('/', (req, res) => {
    res.send("Hello from CDA NodeJS Server");
});
*/

app.get('/', (req, res) => {
    res.render('home', {
      title: 'Akamai CDA Portal',
    });
  });

const server = app.listen(process.env.PORT || 3001, () => {
    console.log(`CDA server started on port: ${server.address().port}`);
});